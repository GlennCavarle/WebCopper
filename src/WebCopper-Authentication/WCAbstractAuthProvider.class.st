"
Strategy to retrieve a User from a token
"
Class {
	#name : #WCAbstractAuthProvider,
	#superclass : #Object,
	#category : #'WebCopper-Authentication-Provider'
}

{ #category : #authenticating }
WCAbstractAuthProvider >> authenticateToken: aToken [
]

{ #category : #testing }
WCAbstractAuthProvider >> supportsToken: aToken [
	^ self subclassResponsibility
]
