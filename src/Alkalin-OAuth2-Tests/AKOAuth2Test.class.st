Class {
	#name : #AKOAuth2Test,
	#superclass : #TestCase,
	#category : #'Alkalin-OAuth2-Tests'
}

{ #category : #tests }
AKOAuth2Test >> testOAuth [
	| storage provider map aRequest oauthServer oauthAuth result |
	storage := AKOAuth2TestingStorage new.
	oauthServer := AKOAuth2Server storage: storage.
	provider := AKOAuth2Provider authService: oauthServer.
		
	oauthAuth := AKOAuth2Authenticator new
						authService: oauthServer;
			 			authProviderManager: (AKAuthProviderManager withProviders: {provider});
						yourself.
	
	map := AKAuthenticatorMap new
		map: (AKUrlMatcher fromRegex: '^/admin.*') to: oauthAuth;
		yourself.
	
	aRequest := AKHttpRequest get: '/admin'.
	aRequest setAuthorization: 'Bearer test-access-token'.
	
	result := map authenticateRequest: aRequest.
	
	self assert: result token isAuthenticated.
	self assert: result token token = 'test-access-token'.
]
