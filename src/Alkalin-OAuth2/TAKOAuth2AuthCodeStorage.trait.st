Trait {
	#name : #TAKOAuth2AuthCodeStorage,
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #'auth code' }
TAKOAuth2AuthCodeStorage >> createAuthCode:aStringCode withParams: aParamsObject [
	self explicitRequirement
]

{ #category : #'auth code' }
TAKOAuth2AuthCodeStorage >> findAuthCode:aStringCode [
	self explicitRequirement
]

{ #category : #'auth code' }
TAKOAuth2AuthCodeStorage >> markAuthCodeAsUsed: aStringCode [
	self explicitRequirement
]

{ #category : #'auth code' }
TAKOAuth2AuthCodeStorage >> supportsAuthCode [
	^ true
]
