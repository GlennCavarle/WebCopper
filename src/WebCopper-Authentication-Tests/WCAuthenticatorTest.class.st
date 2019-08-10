Class {
	#name : #WCAuthenticatorTest,
	#superclass : #TestCase,
	#category : #'WebCopper-Authentication-Tests'
}

{ #category : #tests }
WCAuthenticatorTest >> testBasic [
	| userProvider map aRequest basicAuth result |
	
	userProvider := WCInMemoryUserProvider new
		addUser: (WCUser username: 'John' password: 'password');
		addUser: (WCUser username: 'Brenda' password: 'password').
		
	basicAuth := WCBasicAuthenticator new
			 			authProviderManager: (WCAuthProviderManager withProviders: {userProvider});
						yourself.
	
	map := WCAuthenticatorMap new
		map: (WCUrlMatcher fromRegex: '^/admin.*') to: basicAuth;
		yourself.
	
	aRequest := WCHttpRequest get: '/admin'.
	aRequest setBasicAuthenticationUsername: 'John' password: 'password'.
	
	result := map authenticateRequest: aRequest.
	
	self assert: result token isAuthenticated.
	self assert: result token user = userProvider users first.
]
