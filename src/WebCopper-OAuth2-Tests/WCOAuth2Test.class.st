Class {
	#name : #WCOAuth2Test,
	#superclass : #TestCase,
	#category : #'WebCopper-OAuth2-Tests'
}

{ #category : #tests }
WCOAuth2Test >> testOAuth [
	| storage provider map aRequest oauthServer oauthAuth result |
	storage := WCOAuth2TestingStorage new.
	oauthServer := WCOAuth2Server storage: storage.
	provider := WCOAuth2Provider authService: oauthServer.
		
	oauthAuth := WCOAuth2Authenticator new
						authService: oauthServer;
			 			authProviderManager: (WCAuthProviderManager withProviders: {provider});
						yourself.
	
	map := WCAuthenticatorMap new
		map: (WCUrlMatcher fromRegex: '^/admin.*') to: oauthAuth;
		yourself.
	
	aRequest := WCHttpRequest get: '/admin'.
	aRequest setAuthorization: 'Bearer test-access-token'.
	
	result := map authenticateRequest: aRequest.
	
	self assert: result token isAuthenticated.
	self assert: result token token = 'test-access-token'.
]
