Trait {
	#name : #TAKOAuth2ExtensionStorage,
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #'extended grant type' }
TAKOAuth2ExtensionStorage >> checkGrantExtension: aClient withParams: aParamsObject [
	self explicitRequirement
]

{ #category : #'extended grant type' }
TAKOAuth2ExtensionStorage >> supportsExtendedGrantType [
	^ true
]
