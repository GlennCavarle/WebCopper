Trait {
	#name : #TWCOAuth2ExtensionStorage,
	#category : #'WebCopper-OAuth2-Storage'
}

{ #category : #'extended grant type' }
TWCOAuth2ExtensionStorage >> checkGrantExtension: aClient withParams: aParamsObject [
	self explicitRequirement
]

{ #category : #'extended grant type' }
TWCOAuth2ExtensionStorage >> supportsExtendedGrantType [
	^ true
]
