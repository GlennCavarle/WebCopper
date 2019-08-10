Trait {
	#name : #TWCOAuth2Storage,
	#category : #'WebCopper-OAuth2-Storage'
}

{ #category : #client }
TWCOAuth2Storage >> checkClientSecret: clientSecret forClient: aClient [
	<return:#Boolean>
	self explicitRequirement 
]

{ #category : #client }
TWCOAuth2Storage >> checkGrantType: grantType forClient: aClient [
	<return:#Boolean>
	self explicitRequirement 
]

{ #category : #'access token' }
TWCOAuth2Storage >> createAccessToken: aStringToken withParams: aParamsObject [
	<return: #WCOAuth2AccessTokenModel>
	self explicitRequirement
]

{ #category : #'access token' }
TWCOAuth2Storage >> findAccessToken: aToken [
	self explicitRequirement
]

{ #category : #client }
TWCOAuth2Storage >> findClient: clientId [
	<return:#WCOAuth2ClientModel>
	self explicitRequirement 
]
