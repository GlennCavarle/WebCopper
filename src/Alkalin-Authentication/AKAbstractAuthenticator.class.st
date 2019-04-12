"
Crafts an authentication token from an input request
"
Class {
	#name : #AKAbstractAuthenticator,
	#superclass : #Object,
	#instVars : [
		'authProviderManager'
	],
	#category : #'Alkalin-Authentication-Authenticator'
}

{ #category : #accessing }
AKAbstractAuthenticator >> authProviderManager [
	^ authProviderManager
]

{ #category : #accessing }
AKAbstractAuthenticator >> authProviderManager: anObject [
	authProviderManager := anObject
]

{ #category : #authenticating }
AKAbstractAuthenticator >> authenticateRequest: anHttpRequest [
	self subclassResponsibility 
]
