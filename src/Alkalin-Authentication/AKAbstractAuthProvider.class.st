"
Strategy to retrieve a User from a token
"
Class {
	#name : #AKAbstractAuthProvider,
	#superclass : #Object,
	#category : #'Alkalin-Authentication-Provider'
}

{ #category : #authenticating }
AKAbstractAuthProvider >> authenticateToken: aToken [
]

{ #category : #testing }
AKAbstractAuthProvider >> supportsToken: aToken [
	^ self subclassResponsibility
]
