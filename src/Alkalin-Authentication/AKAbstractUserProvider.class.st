"
Strategy to retrieve a User from a token
"
Class {
	#name : #AKAbstractUserProvider,
	#superclass : #Object,
	#category : #'Alkalin-Authentication-UserProvider'
}

{ #category : #authenticating }
AKAbstractUserProvider >> authenticateToken: aToken [
]

{ #category : #testing }
AKAbstractUserProvider >> supportsToken: aToken [
	^ self subclassResponsibility
]
