Class {
	#name : #WCOAuth2InMemoryStorage,
	#superclass : #WCOAuth2Storage,
	#traits : 'TWCOAuth2Storage + TWCOAuth2AuthCodeStorage + TWCOAuth2ClientCredentialsStorage + TWCOAuth2RefreshTokenStorage + TWCOAuth2UserCredentialsStorage',
	#classTraits : 'TWCOAuth2Storage classTrait + TWCOAuth2AuthCodeStorage classTrait + TWCOAuth2ClientCredentialsStorage classTrait + TWCOAuth2RefreshTokenStorage classTrait + TWCOAuth2UserCredentialsStorage classTrait',
	#instVars : [
		'clients',
		'codes',
		'accessTokens',
		'refreshTokens',
		'users'
	],
	#category : #'WebCopper-OAuth2-Storage'
}

{ #category : #accessing }
WCOAuth2InMemoryStorage >> addAccessToken: anAccessToken [
	^ accessTokens add: anAccessToken
]

{ #category : #accessing }
WCOAuth2InMemoryStorage >> addAuthCode: anAuthCode [
	^ codes add: anAuthCode
]

{ #category : #accessing }
WCOAuth2InMemoryStorage >> addClient: aClient [
	^ clients add: aClient
]

{ #category : #accessing }
WCOAuth2InMemoryStorage >> addUser: aUser [
	^ users add: aUser
]

{ #category : #'client credentials' }
WCOAuth2InMemoryStorage >> checkClientCredentialsGrant: aClient withSecret: clientSecret [
	^ aClient clientSecret = clientSecret
]

{ #category : #client }
WCOAuth2InMemoryStorage >> checkClientSecret: clientSecret forClient: aClient [
	^ clientSecret = nil or:[aClient clientSecret = clientSecret]
]

{ #category : #client }
WCOAuth2InMemoryStorage >> checkGrantType: grantType forClient: aClient [
	^ aClient allowedGrantTypes includes: grantType
]

{ #category : #'user credentials' }
WCOAuth2InMemoryStorage >> checkUserCredentials: credentials withClient: aClient [
	^ users anySatisfy: [ :u| u username = credentials first and:[u password = credentials second]]
]

{ #category : #'access token' }
WCOAuth2InMemoryStorage >> createAccessToken: aStringToken withParams: aParamsObject [
	^ self addAccessToken:
			(WCOAuth2AccessTokenModel new
				token: aStringToken;
				clientId: aParamsObject clientId;
				expiresIn: aParamsObject accessTokenLifetime;
				scope: aParamsObject scope;
				data: aParamsObject data)
]

{ #category : #'auth code' }
WCOAuth2InMemoryStorage >> createAuthCode:aStringCode withParams: aParamsObject [
	^ self addAuthCode: (WCOAuth2AuthCodeModel new
				token: aStringCode;
				clientId: aParamsObject clientId;
				expiresIn: aParamsObject authCodeLifetime;
				redirectUri: aParamsObject redirectUri;
				scope: aParamsObject scope;
				data: aParamsObject data)
]

{ #category : #'refresh token' }
WCOAuth2InMemoryStorage >> createRefreshToken: aStringToken withParams: aParamsObject [
	^ self addAccessToken:
			(WCOAuth2RefreshTokenModel new
				token: aStringToken;
				clientId: aParamsObject clientId;
				expiresIn: aParamsObject refreshTokenLifetime;
				scope: aParamsObject scope;
				data: aParamsObject data)
]

{ #category : #'access token' }
WCOAuth2InMemoryStorage >> findAccessToken: aStringToken [
	^ accessTokens detect: [ :each| each token = aStringToken ] ifNone:[nil]
]

{ #category : #'auth code' }
WCOAuth2InMemoryStorage >> findAuthCode:aStringCode [
	^ codes detect:[:each| each token = aStringCode] ifNone:[nil]
]

{ #category : #client }
WCOAuth2InMemoryStorage >> findClient: clientId [
	^ clients detect: [ :each| each clientId = clientId ]
]

{ #category : #'refresh token' }
WCOAuth2InMemoryStorage >> findRefreshToken: aStringToken [
	^ refreshTokens detect: [ :each| each token = aStringToken ] ifNone:[nil]
]

{ #category : #initialization }
WCOAuth2InMemoryStorage >> initialize [ 
	super initialize.
	users := OrderedCollection new.
	clients := OrderedCollection new.
	codes := OrderedCollection new.
	accessTokens := OrderedCollection new.
	refreshTokens := OrderedCollection new.
]

{ #category : #'auth code' }
WCOAuth2InMemoryStorage >> markAuthCodeAsUsed: aStringCode [
	(self findAuthCode: aStringCode) ifNotNil: [ :code | codes remove: code ]
]

{ #category : #'refresh token' }
WCOAuth2InMemoryStorage >> unsetRefreshToken: aStringToken [
	(self findRefreshToken: aStringToken) ifNotNil: [ :t | refreshTokens remove: t ]
]
