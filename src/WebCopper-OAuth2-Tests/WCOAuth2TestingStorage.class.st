Class {
	#name : #WCOAuth2TestingStorage,
	#superclass : #WCOAuth2InMemoryStorage,
	#category : #'WebCopper-OAuth2-Tests'
}

{ #category : #initialization }
WCOAuth2TestingStorage >> initialize [
	super initialize.
	self
		addClient:
			(WCOAuth2ClientModel new
				clientId: 'test-client-id';
				clientSecret: 'test-client-secret';
				allowedGrantTypes: #(#authorization_code #password #client_credentials);
				redirectUris: #('http://test.com/redirect'));
		addAuthCode:
			(WCOAuth2AuthCodeModel new
				clientId: 'test-client-id';
				expiresAt: (DateAndTime now + 3600 seconds) asUTC asString;
				token: 'test-code';
				redirectUri: 'http://test.com/redirect');
		addAccessToken:
			(WCOAuth2AccessTokenModel new
				clientId: 'test-client-id';
				expiresAt: (DateAndTime now + 3600 seconds) asUTC asString;
				token: 'test-access-token');
		addUser:
			(WCOAuth2UserModel new
				username: 'test-username';
				password: 'test-password')
]
