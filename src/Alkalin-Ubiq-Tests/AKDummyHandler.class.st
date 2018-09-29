Class {
	#name : #AKDummyHandler,
	#superclass : #Object,
	#instVars : [
		'callback',
		'wasCalled'
	],
	#category : #'Alkalin-Ubiq-Tests'
}

{ #category : #accessing }
AKDummyHandler class >> callback: aBlock [
	^ self new callback: aBlock
]

{ #category : #accessing }
AKDummyHandler >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
AKDummyHandler >> handle: aMessage [
	
	callback cull: aMessage.
	wasCalled := true
]

{ #category : #initialization }
AKDummyHandler >> initialize [
	super initialize.
	wasCalled := false
]

{ #category : #accessing }
AKDummyHandler >> wasCalled [
	^ wasCalled
]
