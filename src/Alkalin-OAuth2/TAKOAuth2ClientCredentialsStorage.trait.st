Trait {
	#name : #TAKOAuth2ClientCredentialsStorage,
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #'client credentials' }
TAKOAuth2ClientCredentialsStorage >> checkClientCredentialsGrant: aClient withSecret: clientSecret [
	self explicitRequirement
]

{ #category : #'client credentials' }
TAKOAuth2ClientCredentialsStorage >> supportsClientCredentials [
	^ true
]
