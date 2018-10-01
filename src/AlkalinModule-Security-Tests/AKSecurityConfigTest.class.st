Class {
	#name : #AKSecurityConfigTest,
	#superclass : #TestCase,
	#category : #'AlkalinModule-Security-Tests'
}

{ #category : #tests }
AKSecurityConfigTest >> test [
	| config |
	config := AKSecurityModuleConfig new.
	
	config
		addUserProvider:[:upBuilder|upBuilder
				providerClass: #AKInMemoryUserProvider;
				configure:[:p|p
					addUser: (AKUser username: 'John' password: 'password');
					addUser: (AKUser username: 'Brenda' password: 'password')]
			];
	 
		addAuthenticator:[ :authBuilder| authBuilder 
				urlRegex: '^/admin.*';
				authenticatorClass: #AKBasicAuthenticator
			].
	config buildAuthenticatorMap
]
