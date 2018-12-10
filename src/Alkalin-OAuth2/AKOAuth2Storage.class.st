Class {
	#name : #AKOAuth2Storage,
	#superclass : #Object,
	#category : #'Alkalin-OAuth2-Storage'
}

{ #category : #'as yet unclassified' }
AKOAuth2Storage >> accessTokenFromAuthToken: aToken [
	self subclassResponsibility 
]
