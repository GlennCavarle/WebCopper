Trait {
	#name : #TWCOAuth2RefreshTokenStorage,
	#category : #'WebCopper-OAuth2-Storage'
}

{ #category : #'refresh token' }
TWCOAuth2RefreshTokenStorage >> createRefreshToken: aStringToken withParams: aParamsObject [
	self explicitRequirement 
]

{ #category : #'refresh token' }
TWCOAuth2RefreshTokenStorage >> findRefreshToken: aStringToken [
	self explicitRequirement 
]

{ #category : #'refresh token' }
TWCOAuth2RefreshTokenStorage >> supportsRefreshToken [
	^ true
]

{ #category : #'refresh token' }
TWCOAuth2RefreshTokenStorage >> unsetRefreshToken: aStringToken [
	self explicitRequirement 
]
