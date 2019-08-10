Trait {
	#name : #TWCOAuth2AuthCodeStorage,
	#category : #'WebCopper-OAuth2-Storage'
}

{ #category : #'auth code' }
TWCOAuth2AuthCodeStorage >> createAuthCode:aStringCode withParams: aParamsObject [
	self explicitRequirement
]

{ #category : #'auth code' }
TWCOAuth2AuthCodeStorage >> findAuthCode:aStringCode [
	self explicitRequirement
]

{ #category : #'auth code' }
TWCOAuth2AuthCodeStorage >> markAuthCodeAsUsed: aStringCode [
	self explicitRequirement
]

{ #category : #'auth code' }
TWCOAuth2AuthCodeStorage >> supportsAuthCode [
	^ true
]
