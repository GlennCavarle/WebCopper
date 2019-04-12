Trait {
	#name : #TAKOAuth2Storage,
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #client }
TAKOAuth2Storage >> checkClientSecret: clientSecret forClient: aClient [
	<return:#Boolean>
	self explicitRequirement 
]

{ #category : #client }
TAKOAuth2Storage >> checkGrantType: grantType forClient: aClient [
	<return:#Boolean>
	self explicitRequirement 
]

{ #category : #'access token' }
TAKOAuth2Storage >> createAccessToken: aStringToken withParams: aParamsObject [
	<return: #AKOAuth2AccessTokenModel>
	self explicitRequirement
]

{ #category : #'access token' }
TAKOAuth2Storage >> findAccessToken: aToken [
	self explicitRequirement
]

{ #category : #client }
TAKOAuth2Storage >> findClient: clientId [
	<return:#AKOAuth2ClientModel>
	self explicitRequirement 
]
