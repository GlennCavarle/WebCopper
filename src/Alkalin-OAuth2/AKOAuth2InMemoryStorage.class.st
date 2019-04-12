Class {
	#name : #AKOAuth2InMemoryStorage,
	#superclass : #AKOAuth2Storage,
	#traits : 'TAKOAuth2Storage + TAKOAuth2AuthCodeStorage + TAKOAuth2ClientCredentialsStorage + TAKOAuth2RefreshTokenStorage + TAKOAuth2UserCredentialsStorage',
	#classTraits : 'TAKOAuth2Storage classTrait + TAKOAuth2AuthCodeStorage classTrait + TAKOAuth2ClientCredentialsStorage classTrait + TAKOAuth2RefreshTokenStorage classTrait + TAKOAuth2UserCredentialsStorage classTrait',
	#instVars : [
		'clients',
		'codes',
		'accessTokens',
		'refreshTokens'
	],
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #accessing }
AKOAuth2InMemoryStorage >> addAccessToken: anAccessToken [
	^ accessTokens add: anAccessToken
]

{ #category : #accessing }
AKOAuth2InMemoryStorage >> addAuthCode: anAuthCode [
	^ codes add: anAuthCode
]

{ #category : #accessing }
AKOAuth2InMemoryStorage >> addClient: aClient [
	^ clients add: aClient
]

{ #category : #client }
AKOAuth2InMemoryStorage >> checkClientSecret: clientSecret forClient: aClient [
	^ aClient clientSecret = clientSecret
]

{ #category : #client }
AKOAuth2InMemoryStorage >> checkGrantType: grantType forClient: aClient [
	^ aClient allowedGrantTypes includes: grantType
]

{ #category : #'access token' }
AKOAuth2InMemoryStorage >> createAccessToken: aStringToken withParams: aParamsObject [
	^ self addAccessToken:
			(AKOAuth2AccessTokenModel new
				token: aStringToken;
				clientId: aParamsObject clientId;
				expiresIn: aParamsObject accessTokenLifetime;
				scope: aParamsObject scope;
				data: aParamsObject data)
]

{ #category : #'auth code' }
AKOAuth2InMemoryStorage >> createAuthCode:aStringCode withParams: aParamsObject [
	^ self addAuthCode: (AKOAuth2AuthCodeModel new
				token: aStringCode;
				clientId: aParamsObject clientId;
				expiresIn: aParamsObject accessTokenLifetime;
				redirectUri: aParamsObject redirectUri;
				scope: aParamsObject scope;
				data: aParamsObject data)
]

{ #category : #'refresh token' }
AKOAuth2InMemoryStorage >> createRefreshToken: aStringToken withParams: aParamsObject [
	^ self addAccessToken:
			(AKOAuth2RefreshTokenModel new
				token: aStringToken;
				clientId: aParamsObject clientId;
				expiresIn: aParamsObject refreshTokenLifetime;
				scope: aParamsObject scope;
				data: aParamsObject data)
]

{ #category : #'access token' }
AKOAuth2InMemoryStorage >> findAccessToken: aStringToken [
	^ accessTokens detect: [ :each| each token = aStringToken ] ifNone:[nil]
]

{ #category : #'auth code' }
AKOAuth2InMemoryStorage >> findAuthCode:aStringCode [
	^ codes detect:[:each| each token = aStringCode] ifNone:[nil]
]

{ #category : #client }
AKOAuth2InMemoryStorage >> findClient: clientId [
	^ clients detect: [ :each| each clientId = clientId ]
]

{ #category : #'refresh token' }
AKOAuth2InMemoryStorage >> findRefreshToken: aStringToken [
	^ refreshTokens detect: [ :each| each token = aStringToken ] ifNone:[nil]
]

{ #category : #initialization }
AKOAuth2InMemoryStorage >> initialize [ 
	super initialize.
	clients := OrderedCollection new.
	codes := OrderedCollection new.
	accessTokens := OrderedCollection new.
	refreshTokens := OrderedCollection new.
]

{ #category : #'auth code' }
AKOAuth2InMemoryStorage >> markAuthCodeAsUsed: aStringCode [
	(self findAuthCode: aStringCode) ifNotNil: [ :code | codes remove: code ]
]

{ #category : #'refresh token' }
AKOAuth2InMemoryStorage >> unsetRefreshToken: aStringToken [
	(self findRefreshToken: aStringToken) ifNotNil: [ :t | refreshTokens remove: t ]
]
