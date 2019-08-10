Trait {
	#name : #TWCOAuth2ClientCredentialsStorage,
	#category : #'WebCopper-OAuth2-Storage'
}

{ #category : #'client credentials' }
TWCOAuth2ClientCredentialsStorage >> checkClientCredentialsGrant: aClient withSecret: clientSecret [
	self explicitRequirement
]

{ #category : #'client credentials' }
TWCOAuth2ClientCredentialsStorage >> supportsClientCredentials [
	^ true
]
