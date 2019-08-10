Class {
	#name : #WCDummyHandler,
	#superclass : #Object,
	#instVars : [
		'callback',
		'wasCalled'
	],
	#category : #'WebCopper-Ubiq-Tests'
}

{ #category : #accessing }
WCDummyHandler class >> callback: aBlock [
	^ self new callback: aBlock
]

{ #category : #accessing }
WCDummyHandler >> callback: anObject [
	callback := anObject
]

{ #category : #accessing }
WCDummyHandler >> handle: aMessage [
	
	callback cull: aMessage.
	wasCalled := true
]

{ #category : #initialization }
WCDummyHandler >> initialize [
	super initialize.
	wasCalled := false
]

{ #category : #accessing }
WCDummyHandler >> wasCalled [
	^ wasCalled
]
