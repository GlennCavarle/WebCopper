Trait {
	#name : #TAKOAuth2UserCredentialsStorage,
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #'user credentials' }
TAKOAuth2UserCredentialsStorage >> checkUserCredentials: credentials withClient: aClient [
	self explicitRequirement
]

{ #category : #'user credentials' }
TAKOAuth2UserCredentialsStorage >> supportsUserCredentials [
	^ true
]
