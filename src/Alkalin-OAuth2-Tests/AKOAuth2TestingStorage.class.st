Class {
	#name : #AKOAuth2TestingStorage,
	#superclass : #AKOAuth2InMemoryStorage,
	#category : #'Alkalin-OAuth2-Tests'
}

{ #category : #initialization }
AKOAuth2TestingStorage >> initialize [
	super initialize.
	self
		addClient:
			(AKOAuth2ClientModel new
				clientId: 'test-client-id';
				clientSecret: 'test-client-secret';
				allowedGrantTypes: #(#authorization_code #password #client_credentials);
				redirectUris: #('http://test.com/redirect'));
		addAuthCode:
			(AKOAuth2AuthCodeModel new
				clientId: 'test-client-id';
				expiresAt: (DateAndTime now + 3600 seconds) asUTC asString;
				token: 'test-code';
				redirectUri: 'http://test.com/redirect');
		addAccessToken:
			(AKOAuth2AccessTokenModel new
				clientId: 'test-client-id';
				expiresAt: (DateAndTime now + 3600 seconds) asUTC asString;
				token: 'test-access-token');
		addUser:
			(AKOAuth2UserModel new
				username: 'test-username';
				password: 'test-password')
]
