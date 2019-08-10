Trait {
	#name : #TWCOAuth2UserCredentialsStorage,
	#category : #'WebCopper-OAuth2-Storage'
}

{ #category : #'user credentials' }
TWCOAuth2UserCredentialsStorage >> checkUserCredentials: credentials withClient: aClient [
	self explicitRequirement
]

{ #category : #'user credentials' }
TWCOAuth2UserCredentialsStorage >> supportsUserCredentials [
	^ true
]
