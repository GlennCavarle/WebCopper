Class {
	#name : #AKOAuth2ServerTest,
	#superclass : #TestCase,
	#category : #'Alkalin-OAuth2-Tests'
}

{ #category : #tests }
AKOAuth2ServerTest >> testClientAuthorizeCode [
	| storage oAuthServer aRequest anUriString |
	storage := AKOAuth2TestingStorage new.
	oAuthServer := AKOAuth2Server storage: storage.
	aRequest := AKHttpRequest get: '/auth?response_type=code&client_id=test-client-id&redirect_uri=http://test.com/redirect'.
	anUriString := oAuthServer buildClientRedirectUri: aRequest.
	
	self assert: (anUriString beginsWith: 'http://test.com/redirect')
]

{ #category : #tests }
AKOAuth2ServerTest >> testClientGrantAuthCode [
	| storage oAuthServer aRequest anAccessToken |
	storage := AKOAuth2TestingStorage new.
	oAuthServer := AKOAuth2Server storage: storage.
	aRequest := AKHttpRequest
		post: '/token'
		data:
			{(#grant_type -> 'authorization_code').
			(#code -> 'test-code').
			(#redirect_uri -> 'http://test.com/redirect').
			(#client_id -> 'test-client-id').
			(#client_secret -> 'test-client-secret')}.
			
	anAccessToken := oAuthServer grantAccessTokenFromRequest: aRequest.
	
	self assert: anAccessToken tokenType = 'bearer'.
	self assert: anAccessToken expiresIn = 3600.
	self assert: anAccessToken accessToken isNotNil.
	self assert: anAccessToken refreshToken isNotNil.
	self assert: anAccessToken scope isNil
]

{ #category : #tests }
AKOAuth2ServerTest >> testClientGrantClientCredentials [
	| storage oAuthServer aRequest anAccessToken |
	storage := AKOAuth2TestingStorage new.
	oAuthServer := AKOAuth2Server storage: storage.
	aRequest := AKHttpRequest
		post: '/token'
		data:
			{(#grant_type -> 'client_credentials').
			(#client_id -> 'test-client-id').
			(#client_secret -> 'test-client-secret')}.
			
	anAccessToken := oAuthServer grantAccessTokenFromRequest: aRequest.
	
	self assert: anAccessToken tokenType = 'bearer'.
	self assert: anAccessToken expiresIn = 3600.
	self assert: anAccessToken accessToken isNotNil.
	self assert: anAccessToken refreshToken isNil.
	self assert: anAccessToken scope isEmpty
]

{ #category : #tests }
AKOAuth2ServerTest >> testClientGrantPassword [
	| storage oAuthServer aRequest anAccessToken |
	storage := AKOAuth2TestingStorage new.
	oAuthServer := AKOAuth2Server storage: storage.
	aRequest := AKHttpRequest
		post: '/token'
		data:
			{(#grant_type -> 'password').
			(#username -> 'test-username').
			(#password -> 'test-password').
			(#client_id -> 'test-client-id')}.
			
	anAccessToken := oAuthServer grantAccessTokenFromRequest: aRequest.
	
	self assert: anAccessToken tokenType = 'bearer'.
	self assert: anAccessToken expiresIn = 3600.
	self assert: anAccessToken accessToken isNotNil.
	self assert: anAccessToken refreshToken isNotNil.
	self assert: anAccessToken scope isEmpty
]
