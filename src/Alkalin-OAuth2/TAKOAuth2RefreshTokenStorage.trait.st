Trait {
	#name : #TAKOAuth2RefreshTokenStorage,
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #'refresh token' }
TAKOAuth2RefreshTokenStorage >> createRefreshToken: aStringToken withParams: aParamsObject [
	self explicitRequirement 
]

{ #category : #'refresh token' }
TAKOAuth2RefreshTokenStorage >> findRefreshToken: aStringToken [
	self explicitRequirement 
]

{ #category : #'refresh token' }
TAKOAuth2RefreshTokenStorage >> supportsRefreshToken [
	^ true
]

{ #category : #'refresh token' }
TAKOAuth2RefreshTokenStorage >> unsetRefreshToken: aStringToken [
	self explicitRequirement 
]
