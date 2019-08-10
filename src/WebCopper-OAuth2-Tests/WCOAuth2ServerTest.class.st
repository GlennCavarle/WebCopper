Class {
	#name : #WCOAuth2ServerTest,
	#superclass : #TestCase,
	#category : #'WebCopper-OAuth2-Tests'
}

{ #category : #tests }
WCOAuth2ServerTest >> testClientAuthorizeCode [
	| storage oAuthServer aRequest anUriString redirectUrl |
	storage := WCOAuth2TestingStorage new.
	oAuthServer := WCOAuth2Server storage: storage.
	aRequest := WCHttpRequest get: '/auth?response_type=code&client_id=test-client-id&redirect_uri=http://test.com/redirect&state=state123'.
	anUriString := oAuthServer buildClientRedirectUri: aRequest withData:nil.
	redirectUrl := ZnUrl fromString: anUriString.
	self assert: (redirectUrl asString beginsWith: 'http://test.com/redirect').
	self assert: (redirectUrl queryKeys includes:#code).
	self assert: (redirectUrl queryKeys includes:#state).
	self assert: (redirectUrl queryAt:#state) = #state123.
]

{ #category : #tests }
WCOAuth2ServerTest >> testClientGrantAuthCode [
	| storage oAuthServer aRequest anAccessToken |
	storage := WCOAuth2TestingStorage new.
	oAuthServer := WCOAuth2Server storage: storage.
	aRequest := WCHttpRequest
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
WCOAuth2ServerTest >> testClientGrantClientCredentials [
	| storage oAuthServer aRequest anAccessToken |
	storage := WCOAuth2TestingStorage new.
	oAuthServer := WCOAuth2Server storage: storage.
	aRequest := WCHttpRequest
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
WCOAuth2ServerTest >> testClientGrantPassword [
	| storage oAuthServer aRequest anAccessToken |
	storage := WCOAuth2TestingStorage new.
	oAuthServer := WCOAuth2Server storage: storage.
	aRequest := WCHttpRequest
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
