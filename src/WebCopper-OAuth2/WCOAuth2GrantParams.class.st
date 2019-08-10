Class {
	#name : #WCOAuth2GrantParams,
	#superclass : #WCOAuth2RequestParams,
	#instVars : [
		'clientSecret',
		'grantType',
		'username',
		'password',
		'refreshToken',
		'code',
		'clientCredentials'
	],
	#category : #'WebCopper-OAuth2-Service'
}

{ #category : #'instance creation' }
WCOAuth2GrantParams class >> fromRequest: aRequest [
	^ self basicNew
		initializeFromRequest: aRequest;
		yourself
]

{ #category : #accessing }
WCOAuth2GrantParams >> clientCredentials [
	^ clientCredentials
]

{ #category : #accessing }
WCOAuth2GrantParams >> clientSecret [
	^ clientSecret
]

{ #category : #accessing }
WCOAuth2GrantParams >> clientSecret: anObject [
	clientSecret := anObject
]

{ #category : #accessing }
WCOAuth2GrantParams >> code [
	^ code
]

{ #category : #accessing }
WCOAuth2GrantParams >> code: anObject [
	code := anObject
]

{ #category : #private }
WCOAuth2GrantParams >> ensureRedirectUriBasedOnAuthCode: anAuthCode [
	| parsedUri |
	
	(redirectUri  isNil or:[anAuthCode redirectUri isNil])
		ifTrue: [ WCOAuth2InvalidRequest signal: 'No redirect URL was supplied or registred' ].
			
	
	parsedUri := ZnUrl fromString: redirectUri.
	parsedUri = (ZnUrl fromString: anAuthCode redirectUri)
		ifFalse: [ WCOAuth2RedirectUriMismatch signal: 'The redirect URI provided does not match registered URI(s).' ].
	redirectUri := parsedUri asString
]

{ #category : #accessing }
WCOAuth2GrantParams >> grantType [
	^ grantType
]

{ #category : #accessing }
WCOAuth2GrantParams >> grantType: anObject [
	grantType := anObject
]

{ #category : #testing }
WCOAuth2GrantParams >> hasUsernameAndPassword [
	^ username isNotNil and: [password isNotNil]
]

{ #category : #initialization }
WCOAuth2GrantParams >> initializeFromRequest: aRequest [
	| basicAuth |
	self initialize.
	clientId := aRequest paramAt: 'client_id' ifAbsent: [ nil ].
	clientSecret := aRequest paramAt: 'client_secret' ifAbsent: [ nil ].
	grantType := aRequest paramAt: 'grant_type' ifAbsent: [ WCOAuth2InvalidRequest  signal: 'Invalid grant_type parameter or parameter missing' ].
	scope := aRequest paramAt: 'scope' ifAbsent: [ '' ].
	code := aRequest paramAt: 'code' ifAbsent: [ nil ].
	redirectUri := aRequest paramAt: 'redirect_uri' ifAbsent: [ nil ].
	username := aRequest paramAt: 'username' ifAbsent: [ nil ].
	password := aRequest paramAt: 'password' ifAbsent: [ nil ].
	refreshToken := aRequest paramAt: 'refresh_token' ifAbsent: [ nil ].
	
	aRequest headers at: 'Authorization' ifPresent: [ basicAuth := aRequest basicAuthentication ].
	clientCredentials := basicAuth ifNil: [ 
		{
			(clientId ifNil: [ WCOAuth2InvalidClient signal: 'Client id was not found in the headers or body' ]).
		 	clientSecret
		} ]
]

{ #category : #accessing }
WCOAuth2GrantParams >> password [
	^ password
]

{ #category : #accessing }
WCOAuth2GrantParams >> password: anObject [
	password := anObject
]

{ #category : #accessing }
WCOAuth2GrantParams >> refreshToken [
	^ refreshToken
]

{ #category : #accessing }
WCOAuth2GrantParams >> refreshToken: anObject [
	refreshToken := anObject
]

{ #category : #accessing }
WCOAuth2GrantParams >> userCredentials [
	^ {username.password}
]

{ #category : #accessing }
WCOAuth2GrantParams >> username [
	^ username
]

{ #category : #accessing }
WCOAuth2GrantParams >> username: anObject [
	username := anObject
]
