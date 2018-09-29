Class {
	#name : #AKDiReference,
	#superclass : #Object,
	#category : #'Alkalin-Di-Reference'
}

{ #category : #converting }
AKDiReference >> asAKRef [
	^ self
]

{ #category : #converting }
AKDiReference >> asAKServiceRef [
	^ self
]

{ #category : #testing }
AKDiReference >> isAKRef [
	^ true
]

{ #category : #'as yet unclassified' }
AKDiReference >> resolveUsing: aServiceContainer [
	self subclassResponsibility
]
