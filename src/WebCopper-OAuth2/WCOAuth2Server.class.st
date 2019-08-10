Class {
	#name : #WCOAuth2Server,
	#superclass : #Object,
	#instVars : [
		'storage'
	],
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #accessing }
WCOAuth2Server class >> storage: aStorage [
	^ self new
		storage: aStorage;
		yourself
]

{ #category : #authenticate }
WCOAuth2Server >> bearerTokenFromBody: anHttpRequest [
| contentTypeHeader |

	(anHttpRequest method = #GET) ifTrue:[^ nil].
	contentTypeHeader := anHttpRequest headers contentType ifNil: [ ^ nil ].
	(contentTypeHeader = ZnMimeType applicationFormUrlEncoded) ifFalse: [ ^ nil ].
	
	^ anHttpRequest entity partNamed:'access_token' ifNone:[nil].
	
]

{ #category : #authenticate }
WCOAuth2Server >> bearerTokenFromHeaders: anHttpRequest [
| authHeader authHeaderPart |
	authHeader := anHttpRequest headers at: 'Authorization' 
		ifAbsent: [ ^ nil ].
	
	authHeaderPart := authHeader findTokens: ' '.
	(authHeaderPart size = 2 and: [ authHeaderPart first = 'Bearer' ])
		ifFalse: [ ^ nil  ].
	
	^ authHeaderPart second
]

{ #category : #authenticate }
WCOAuth2Server >> bearerTokenFromQuery: anHttpRequest [
	^ anHttpRequest uri queryAt: 'access_token' ifAbsent: [ nil ]
]

{ #category : #authorize }
WCOAuth2Server >> buildClientRedirectUri: aRequest withData:data [
	| params client authCodeData |
	params := WCOAuth2AuthorizeParams fromRequest: aRequest.
	client := self retrieveClient: params clientId.
	params ensureRedirectUriBasedOnClient: client.
	authCodeData := self createAuthCode: params client: client data: data.
	^ authCodeData redirectUri 
]

{ #category : #private }
WCOAuth2Server >> checkClient:aClient withCredentials: credentials [
	self storage checkClient:aClient withCredentials: credentials
]

{ #category : #private }
WCOAuth2Server >> checkClientSecret: clientSecret forClient: aClient [
	(self storage checkClientSecret: clientSecret forClient: aClient) 
		ifFalse:[WCOAuth2InvalidClient signal: 'The client credentials are invalid']
]

{ #category : #private }
WCOAuth2Server >> checkGrantType: grantType forClient: aClient [
	(self storage checkGrantType: grantType forClient: aClient) 
		ifFalse:[WCOAuth2UnauthorizedClient signal: 'The grant type is unauthorized for this client_id']
]

{ #category : #'private - grant ' }
WCOAuth2Server >> createAccessToken: grantData [
	| atokenStr rtokenStr accessToken |
	
	accessToken := WCOAuth2AccessToken new
		expiresIn: grantData accessTokenLifetime;
		tokenType: 'bearer';
		scope: grantData scope;
		yourself.
		
	atokenStr := self genRandomToken.
	
	self storage createAccessToken: atokenStr withParams: grantData.
	accessToken accessToken: atokenStr.
	
	(self storage supportsRefreshToken and: [ grantData issueRefreshToken ]) ifTrue: [ 
			rtokenStr := self genRandomToken.
			self storage createRefreshToken: rtokenStr withParams: grantData.
			accessToken refreshToken: rtokenStr.
			
			grantData usedRefreshToken ifNotNil: [ :t | 
					self storage unsetRefreshToken: t token.
					grantData usedRefreshToken: nil ] ].
			
	(self storage supportsAuthCode and: [ grantData usedAuthCode isNotNil ])
		ifTrue: [ self storage markAuthCodeAsUsed: grantData usedAuthCode token.
			grantData usedAuthCode: nil ].
		
	^ accessToken
]

{ #category : #authorize }
WCOAuth2Server >> createAuthCode: aParamsObject client: aClient data: data [
	| acstr authData|
	acstr := self genRandomToken.
	authData := WCOAuth2AuthorizeData new
		client: aClient;
		scope: aParamsObject scope;
		data: data;
		redirectUri:  (aParamsObject callbackUriWithCode: acstr).
		
	self storage createAuthCode: acstr withParams: authData.
	^ authData
]

{ #category : #authenticate }
WCOAuth2Server >> extractBearerTokenFromRequest: anHttpRequest [
	<return: #WCOAuth2Token>
	| tokens oauth2Token|
	tokens := OrderedCollection new.
	
	(self bearerTokenFromHeaders: anHttpRequest) ifNotNil:[:t| tokens add: t].
	(self bearerTokenFromBody: anHttpRequest) ifNotNil:[:t| tokens add: t].
	(self bearerTokenFromQuery: anHttpRequest) ifNotNil:[:t| tokens add: t].
	
	(tokens size > 1) ifTrue: [ 
		WCOAuth2TooManyTokens signal: 'Only one method may be used to authenticate at a time (Header, Body or Query)'  ].
		
	oauth2Token := WCOAuth2Token token: tokens first.
	^ oauth2Token
]

{ #category : #private }
WCOAuth2Server >> genRandomToken [
	^ (SecureRandom new nextBytes:100) base64Encoded.
	
]

{ #category : #'private - grant ' }
WCOAuth2Server >> grantAccessAuthCode: grantParams withClient: aClient [
	|authCode|
	self storage supportsAuthCode
		ifFalse: [ WCOAuth2UnsupportedGrantType signal ].
		
	grantParams code ifNil:[WCOAuth2InvalidRequest signal:'Missing parameter. "code" is required'].
	authCode := self storage findAuthCode: grantParams code.
	(authCode isNil or:[authCode clientId ~= aClient clientId]) 
		ifTrue:[WCOAuth2InvalidGrant signal:'Code doesn''t exist or is invalid for the client'].
		
	grantParams ensureRedirectUriBasedOnAuthCode: authCode.
	authCode isExpired ifTrue:[WCOAuth2InvalidGrant signal:'The authorization code has expired'].
	
	^ WCOAuth2GrantData new
		client: aClient;
		scope: authCode scope;
		data: authCode data;
		usedAuthCode: authCode;
		yourself
]

{ #category : #'private - grant ' }
WCOAuth2Server >> grantAccessClientCredentials: grantParams withClient: aClient [
	self storage supportsClientCredentials
		ifFalse: [ WCOAuth2UnsupportedGrantType signal ].
		
	grantParams clientCredentials second
		ifEmpty: [ WCOAuth2InvalidClient signal: 'The client_secret is mandatory for the "client_credentials" grant type' ].
	
	(self storage checkClientCredentialsGrant: aClient withSecret: grantParams clientCredentials second)
		ifFalse: [ WCOAuth2InvalidGrant signal ].
		
	^ WCOAuth2GrantData new
		client: aClient;
		issueRefreshToken: false;
		yourself
]

{ #category : #'private - grant ' }
WCOAuth2Server >> grantAccessExtension: grantParams withClient: aClient [
	self storage supportsExtendedGrantType
		ifFalse: [ WCOAuth2UnsupportedGrantType signal ].
		
	self notYetImplemented 
]

{ #category : #'private - grant ' }
WCOAuth2Server >> grantAccessRefreshToken: grantParams  withClient: aClient [
	|refreshToken|
	self storage supportsRefreshToken 
		ifFalse: [ WCOAuth2UnsupportedGrantType signal ].
		
	grantParams refreshToken 
		ifNil:[ WCOAuth2InvalidRequest signal:'No "refresh_token" parameter found'].
	
	refreshToken := self storage findRefreshToken: grantParams refreshToken.
	
	(refreshToken isNil or:[refreshToken clientId ~= aClient clientId])
		ifTrue:[WCOAuth2InvalidGrant signal:'Refresh token has expired'].
		
	^ WCOAuth2GrantData new
		client: aClient;
		scope: refreshToken scope;
		data: refreshToken data;
		currentRefreshToken: refreshToken token;
		yourself
]

{ #category : #grant }
WCOAuth2Server >> grantAccessTokenFromRequest: aRequest [
	| params client grantData|
	
	params := WCOAuth2GrantParams fromRequest: aRequest.
	
	client := self retrieveClient: params clientCredentials first.
	self checkClientSecret: params clientCredentials second forClient: client.
	self checkGrantType: params grantType forClient: client.
	
	params grantType = WCOAuth2GrantType AUTH_CODE
		ifTrue: [ grantData := self grantAccessAuthCode: params withClient: client ].
	params grantType = WCOAuth2GrantType USER_CREDENTIALS
		ifTrue: [ grantData := self grantAccessUserCredentials: params withClient: client ].
	params grantType = WCOAuth2GrantType CLIENT_CREDENTIALS
		ifTrue: [ grantData := self grantAccessClientCredentials: params withClient: client ].
	params grantType = WCOAuth2GrantType REFRESH_TOKEN
		ifTrue: [ grantData := self grantAccessRefreshToken: params withClient: client ].
		
	"@todo check scope"
	
	^ self createAccessToken: grantData
]

{ #category : #'private - grant ' }
WCOAuth2Server >> grantAccessUserCredentials: grantParams  withClient: aClient [
self storage supportsUserCredentials 
		ifFalse: [ WCOAuth2UnsupportedGrantType signal ].
		
	grantParams hasUsernameAndPassword 
		ifFalse:[WCOAuth2InvalidRequest signal:'Missing parameters. "username" and "password" required'].
	
	(self storage checkUserCredentials: grantParams userCredentials withClient: aClient)
		ifFalse:[WCOAuth2InvalidGrant signal:'Invalid username and password combination'].
		
	^ WCOAuth2GrantData new
			client: aClient;
			yourself 
]

{ #category : #accessing }
WCOAuth2Server >> jsonHeaders [
	^ ZnHeaders withAll: {
		'Content-Type' -> 'application/json'.
      'Cache-Control' -> 'no-store'.
      'Pragma' -> 'no-cache'
	 } asDictionary 
]

{ #category : #private }
WCOAuth2Server >> retrieveClient: aClientId [
	^ (self storage findClient: aClientId) ifNil: [ WCOAuth2InvalidClient signal: 'Unknown client' ]
]

{ #category : #accessing }
WCOAuth2Server >> storage [
	^ storage
]

{ #category : #accessing }
WCOAuth2Server >> storage: anObject [
	storage := anObject
]

{ #category : #authenticate }
WCOAuth2Server >> verifyAccessToken: aStringToken [
	| accessToken |
	accessToken := self storage findAccessToken: aStringToken.
	accessToken ifNil: [ WCOAuth2Unauthorized signal: 'The access token provided is invalid' ].
	accessToken isExpired ifTrue: [ WCOAuth2Unauthorized signal: 'The access token provided has expired' ].
	^ accessToken
]
