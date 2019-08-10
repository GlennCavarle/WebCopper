"
Crafts an authentication token from an input request
"
Class {
	#name : #WCAbstractAuthenticator,
	#superclass : #Object,
	#instVars : [
		'authProviderManager'
	],
	#category : #'WebCopper-Authentication-Authenticator'
}

{ #category : #accessing }
WCAbstractAuthenticator >> authProviderManager [
	^ authProviderManager
]

{ #category : #accessing }
WCAbstractAuthenticator >> authProviderManager: anObject [
	authProviderManager := anObject
]

{ #category : #authenticating }
WCAbstractAuthenticator >> authenticateRequest: anHttpRequest [
	self subclassResponsibility 
]
