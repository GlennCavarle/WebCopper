Class {
	#name : #AKAuthenticatorTest,
	#superclass : #TestCase,
	#category : #'Alkalin-Authentication-Tests'
}

{ #category : #tests }
AKAuthenticatorTest >> testBasic [
	| userProvider map aRequest basicAuth result |
	
	userProvider := AKInMemoryUserProvider new
		addUser: (AKUser username: 'John' password: 'password');
		addUser: (AKUser username: 'Brenda' password: 'password').
		
	basicAuth := AKBasicAuthenticator new
			 			userProviderManager: (AKUserProviderManager withProviders: {userProvider});
						yourself.
	
	map := AKAuthenticatorMap new
		map: (AKUrlMatcher fromRegex: '^/admin.*') to: basicAuth;
		yourself.
	
	aRequest := AKHttpRequest get: '/admin'.
	aRequest setBasicAuthenticationUsername: 'John' password: 'password'.
	
	result := map authenticateRequest: aRequest.
	
	self assert: result token isAuthenticated.
	self assert: result token user = userProvider users first.
]
