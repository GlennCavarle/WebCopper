"
Crafts an authentication token from an input request
"
Class {
	#name : #AKAbstractAuthenticator,
	#superclass : #Object,
	#instVars : [
		'userProviderManager'
	],
	#category : #'Alkalin-Authentication-Authenticator'
}

{ #category : #authenticating }
AKAbstractAuthenticator >> authenticateRequest: anHttpRequest [
	self subclassResponsibility 
]

{ #category : #accessing }
AKAbstractAuthenticator >> userProviderManager [
	^ userProviderManager
]

{ #category : #accessing }
AKAbstractAuthenticator >> userProviderManager: anObject [
	userProviderManager := anObject
]
