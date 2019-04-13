Class {
	#name : #AKOAuth2Server,
	#superclass : #Object,
	#instVars : [
		'storage'
	],
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #accessing }
AKOAuth2Server class >> storage: aStorage [
	^ self new
		storage: aStorage;
		yourself
]

{ #category : #authenticate }
AKOAuth2Server >> bearerTokenFromBody: anHttpRequest [
| contentTypeHeader |

	(anHttpRequest method = #GET) ifTrue:[^ nil].
	contentTypeHeader := anHttpRequest headers contentType ifNil: [ ^ nil ].
	(contentTypeHeader = ZnMimeType applicationFormUrlEncoded) ifFalse: [ ^ nil ].
	
	^ anHttpRequest entity partNamed:'access_token' ifNone:[nil].
	
]

{ #category : #authenticate }
AKOAuth2Server >> bearerTokenFromHeaders: anHttpRequest [
| authHeader authHeaderPart |
	authHeader := anHttpRequest headers at: 'Authorization' 
		ifAbsent: [ ^ nil ].
	
	authHeaderPart := authHeader findTokens: ' '.
	(authHeaderPart size = 2 and: [ authHeaderPart first = 'Bearer' ])
		ifFalse: [ ^ nil  ].
	
	^ authHeaderPart second
]

{ #category : #authenticate }
AKOAuth2Server >> bearerTokenFromQuery: anHttpRequest [
	^ anHttpRequest uri queryAt: 'access_token' ifAbsent: [ nil ]
]

{ #category : #authorize }
AKOAuth2Server >> buildClientRedirectUri: aRequest [
	| params client|
	params := AKOAuth2AuthorizeParams fromRequest: aRequest.
	client := self retrieveClient:  params clientId.
	params ensureRedirectUriBasedOnClient: client.
	
	^ params callbackUri
]

{ #category : #private }
AKOAuth2Server >> checkClient:aClient withCredentials: credentials [
	self storage checkClient:aClient withCredentials: credentials
]

{ #category : #private }
AKOAuth2Server >> checkClientSecret: clientSecret forClient: aClient [
	(self storage checkClientSecret: clientSecret forClient: aClient) 
		ifFalse:[AKOAuth2InvalidClient signal: 'The client credentials are invalid']
]

{ #category : #private }
AKOAuth2Server >> checkGrantType: grantType forClient: aClient [
	(self storage checkGrantType: grantType forClient: aClient) 
		ifFalse:[AKOAuth2UnauthorizedClient signal: 'The grant type is unauthorized for this client_id']
]

{ #category : #'private - grant ' }
AKOAuth2Server >> createAccessToken: grantData [
	| atokenStr rtokenStr respToken |
	
	respToken := AKOAuth2GrantAccessToken new
		expiresIn: grantData accessTokenLifetime;
		tokenType: 'bearer';
		scope: grantData scope;
		yourself.
		
	atokenStr := self genRandomToken.
	
	self storage createAccessToken: atokenStr withParams: grantData.
	respToken accessToken: atokenStr.
	
	(self storage supportsRefreshToken and: [ grantData issueRefreshToken ]) ifTrue: [ 
			rtokenStr := self genRandomToken.
			self storage createRefreshToken: rtokenStr withParams: grantData.
			respToken refreshToken: rtokenStr.
			
			grantData usedRefreshToken ifNotNil: [ :t | 
					self storage unsetRefreshToken: t token.
					grantData usedRefreshToken: nil ] ].
			
	(self storage supportsAuthCode and: [ grantData usedAuthCode isNotNil ])
		ifTrue: [ self storage markAuthCodeAsUsed: grantData usedAuthCode token.
			grantData usedAuthCode: nil ].
		
	^ respToken
]

{ #category : #authenticate }
AKOAuth2Server >> extractBearerTokenFromRequest: anHttpRequest [
	<return: #AKOAuth2AccessToken>
	| tokens oauth2Token|
	tokens := OrderedCollection new.
	
	(self bearerTokenFromHeaders: anHttpRequest) ifNotNil:[:t| tokens add: t].
	(self bearerTokenFromBody: anHttpRequest) ifNotNil:[:t| tokens add: t].
	(self bearerTokenFromQuery: anHttpRequest) ifNotNil:[:t| tokens add: t].
	
	(tokens size > 1) ifTrue: [ 
		AKOAuth2TooManyTokens signal: 'Only one method may be used to authenticate at a time (Header, Body or Query)'  ].
		
	oauth2Token := AKOAuth2Token token: tokens first.
	^ oauth2Token
]

{ #category : #private }
AKOAuth2Server >> genRandomToken [
	^ (SecureRandom new nextBytes:100) base64Encoded.
	
]

{ #category : #'private - grant ' }
AKOAuth2Server >> grantAccessAuthCode: grantParams withClient: aClient [
	|authCode|
	self storage supportsAuthCode
		ifFalse: [ AKOAuth2UnsupportedGrantType signal ].
		
	grantParams code ifNil:[AKOAuth2InvalidRequest signal:'Missing parameter. "code" is required'].
	authCode := self storage findAuthCode: grantParams code.
	(authCode isNil or:[authCode clientId ~= aClient clientId]) 
		ifTrue:[AKOAuth2InvalidGrant signal:'Code doesn''t exist or is invalid for the client'].
		
	grantParams ensureRedirectUriBasedOnAuthCode: authCode.
	authCode isExpired ifTrue:[AKOAuth2InvalidGrant signal:'The authorization code has expired'].
	
	^ AKOAuth2GrantData new
		client: aClient;
		scope: authCode scope;
		data: authCode data;
		usedAuthCode: authCode;
		yourself
]

{ #category : #'private - grant ' }
AKOAuth2Server >> grantAccessClientCredentials: grantParams withClient: aClient [
	self storage supportsClientCredentials
		ifFalse: [ AKOAuth2UnsupportedGrantType signal ].
		
	grantParams clientCredentials second
		ifEmpty: [ AKOAuth2InvalidClient signal: 'The client_secret is mandatory for the "client_credentials" grant type' ].
	
	(self storage checkClientCredentialsGrant: aClient withSecret: grantParams clientCredentials second)
		ifFalse: [ AKOAuth2InvalidGrant signal ].
		
	^ AKOAuth2GrantData new
		client: aClient;
		issueRefreshToken: false;
		yourself
]

{ #category : #'private - grant ' }
AKOAuth2Server >> grantAccessExtension: grantParams withClient: aClient [
	self storage supportsExtendedGrantType
		ifFalse: [ AKOAuth2UnsupportedGrantType signal ].
		
	self notYetImplemented 
]

{ #category : #'private - grant ' }
AKOAuth2Server >> grantAccessRefreshToken: grantParams  withClient: aClient [
	|refreshToken|
	self storage supportsRefreshToken 
		ifFalse: [ AKOAuth2UnsupportedGrantType signal ].
		
	grantParams refreshToken 
		ifNil:[ AKOAuth2InvalidRequest signal:'No "refresh_token" parameter found'].
	
	refreshToken := self storage findRefreshToken: grantParams refreshToken.
	
	(refreshToken isNil or:[refreshToken clientId ~= aClient clientId])
		ifTrue:[AKOAuth2InvalidGrant signal:'Refresh token has expired'].
		
	^ AKOAuth2GrantData new
		client: aClient;
		scope: refreshToken scope;
		data: refreshToken data;
		currentRefreshToken: refreshToken token;
		yourself
]

{ #category : #grant }
AKOAuth2Server >> grantAccessTokenFromRequest: aRequest [
	| params client grantData|
	
	params := AKOAuth2GrantParams fromRequest: aRequest.
	
	client := self retrieveClient: params clientCredentials first.
	self checkClientSecret: params clientCredentials second forClient: client.
	self checkGrantType: params grantType forClient: client.
	
	params grantType = AKOAuth2GrantType AUTH_CODE
		ifTrue: [ grantData := self grantAccessAuthCode: params withClient: client ].
	params grantType = AKOAuth2GrantType USER_CREDENTIALS
		ifTrue: [ grantData := self grantAccessUserCredentials: params withClient: client ].
	params grantType = AKOAuth2GrantType CLIENT_CREDENTIALS
		ifTrue: [ grantData := self grantAccessClientCredentials: params withClient: client ].
	params grantType = AKOAuth2GrantType REFRESH_TOKEN
		ifTrue: [ grantData := self grantAccessRefreshToken: params withClient: client ].
		
	"@todo check scope"
	
	^ self createAccessToken: grantData
]

{ #category : #'private - grant ' }
AKOAuth2Server >> grantAccessUserCredentials: grantParams  withClient: aClient [
self storage supportsUserCredentials 
		ifFalse: [ AKOAuth2UnsupportedGrantType signal ].
		
	grantParams hasUsernameAndPassword 
		ifFalse:[AKOAuth2InvalidRequest signal:'Missing parameters. "username" and "password" required'].
	
	(self storage checkUserCredentials: grantParams userCredentials withClient: aClient)
		ifFalse:[AKOAuth2InvalidGrant signal:'Invalid username and password combination'].
		
	^ AKOAuth2GrantData new
			client: aClient;
			yourself 
]

{ #category : #accessing }
AKOAuth2Server >> jsonHeaders [
	^ ZnHeaders withAll: {
		'Content-Type' -> 'application/json'.
      'Cache-Control' -> 'no-store'.
      'Pragma' -> 'no-cache'
	 } asDictionary 
]

{ #category : #private }
AKOAuth2Server >> retrieveClient: aClientId [
	^ (self storage findClient: aClientId) ifNil: [ AKOAuth2InvalidClient signal: 'Unknown client' ]
]

{ #category : #accessing }
AKOAuth2Server >> storage [
	^ storage
]

{ #category : #accessing }
AKOAuth2Server >> storage: anObject [
	storage := anObject
]

{ #category : #authenticate }
AKOAuth2Server >> verifyAccessToken: aStringToken [
	| accessToken |
	accessToken := self storage findAccessToken: aStringToken.
	accessToken ifNil: [ AKOAuth2Unauthorized signal: 'The access token provided is invalid' ].
	accessToken isExpired ifTrue: [ AKOAuth2Unauthorized signal: 'The access token provided has expired' ].
	^ accessToken
]
