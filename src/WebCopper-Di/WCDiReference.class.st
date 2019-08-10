Class {
	#name : #WCDiReference,
	#superclass : #Object,
	#category : #'WebCopper-Di-Reference'
}

{ #category : #converting }
WCDiReference >> asWCRef [
	^ self
]

{ #category : #converting }
WCDiReference >> asWCServiceRef [
	^ self
]

{ #category : #testing }
WCDiReference >> isWCRef [
	^ true
]

{ #category : #'as yet unclassified' }
WCDiReference >> resolveUsing: aServiceContainer [
	self subclassResponsibility
]
