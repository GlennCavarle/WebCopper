Class {
	#name : #AKOAuth2GrantParams,
	#superclass : #Object,
	#instVars : [
		'clientId',
		'clientSecret',
		'grantType',
		'scope',
		'redirectUri',
		'username',
		'password',
		'refreshToken',
		'code',
		'clientCredentials'
	],
	#category : #'Alkalin-OAuth2-Service'
}

{ #category : #'instance creation' }
AKOAuth2GrantParams class >> fromRequest: aRequest [
	^ self basicNew
		initializeFromRequest: aRequest;
		yourself
]

{ #category : #accessing }
AKOAuth2GrantParams >> clientCredentials [
	^ clientCredentials
]

{ #category : #accessing }
AKOAuth2GrantParams >> clientId [
	^ clientId
]

{ #category : #accessing }
AKOAuth2GrantParams >> clientId: anObject [
	clientId := anObject
]

{ #category : #accessing }
AKOAuth2GrantParams >> clientSecret [
	^ clientSecret
]

{ #category : #accessing }
AKOAuth2GrantParams >> clientSecret: anObject [
	clientSecret := anObject
]

{ #category : #accessing }
AKOAuth2GrantParams >> code [
	^ code
]

{ #category : #accessing }
AKOAuth2GrantParams >> code: anObject [
	code := anObject
]

{ #category : #'as yet unclassified' }
AKOAuth2GrantParams >> ensureRedirectUriBasedOnAuthCode: anAuthCode [
	| parsedUri |
	
	(redirectUri  isNil or:[anAuthCode redirectUri isNil])
		ifTrue: [ AKOAuth2InvalidRequest signal: 'No redirect URL was supplied or registred' ].
			
	
	parsedUri := ZnUrl fromString: redirectUri.
	parsedUri = (ZnUrl fromString: anAuthCode redirectUri)
		ifFalse: [ AKOAuth2RedirectUriMismatch signal: 'The redirect URI provided does not match registered URI(s).' ].
	redirectUri := parsedUri asString
]

{ #category : #accessing }
AKOAuth2GrantParams >> grantType [
	^ grantType
]

{ #category : #accessing }
AKOAuth2GrantParams >> grantType: anObject [
	grantType := anObject
]

{ #category : #testing }
AKOAuth2GrantParams >> hasUsernameAndPassword [
	^ username isNotNil and: [password isNotNil]
]

{ #category : #initialization }
AKOAuth2GrantParams >> initializeFromRequest: aRequest [
	| basicAuth |
	self initialize.
	clientId := aRequest paramAt: 'client_id' ifAbsent: [ nil ].
	clientSecret := aRequest paramAt: 'client_secret' ifAbsent: [ nil ].
	grantType := aRequest paramAt: 'grant_type' ifAbsent: [ AKOAuth2InvalidRequest  signal: 'Invalid grant_type parameter or parameter missing' ].
	scope := aRequest paramAt: 'scope' ifAbsent: [ '' ].
	code := aRequest paramAt: 'code' ifAbsent: [ nil ].
	redirectUri := aRequest paramAt: 'redirect_uri'.
	username := aRequest paramAt: 'username' ifAbsent: [ nil ].
	password := aRequest paramAt: 'password' ifAbsent: [ nil ].
	refreshToken := aRequest paramAt: 'refresh_token' ifAbsent: [ nil ].
	
	aRequest headers at: 'Authorization' ifPresent: [ basicAuth := aRequest basicAuthentication ].
	clientCredentials := basicAuth ifNil: [ 
		{
			(clientId ifNil: [ AKOAuth2InvalidClient signal: 'Client id was not found in the headers or body' ]).
		 	clientSecret
		} ]
]

{ #category : #accessing }
AKOAuth2GrantParams >> password [
	^ password
]

{ #category : #accessing }
AKOAuth2GrantParams >> password: anObject [
	password := anObject
]

{ #category : #accessing }
AKOAuth2GrantParams >> redirectUri [
	^ redirectUri
]

{ #category : #accessing }
AKOAuth2GrantParams >> redirectUri: anObject [
	redirectUri := anObject
]

{ #category : #accessing }
AKOAuth2GrantParams >> refreshToken [
	^ refreshToken
]

{ #category : #accessing }
AKOAuth2GrantParams >> refreshToken: anObject [
	refreshToken := anObject
]

{ #category : #accessing }
AKOAuth2GrantParams >> scope [
	^ scope
]

{ #category : #accessing }
AKOAuth2GrantParams >> scope: anObject [
	scope := anObject
]

{ #category : #accessing }
AKOAuth2GrantParams >> userCredentials [
	^ {username.password}
]

{ #category : #accessing }
AKOAuth2GrantParams >> username [
	^ username
]

{ #category : #accessing }
AKOAuth2GrantParams >> username: anObject [
	username := anObject
]
