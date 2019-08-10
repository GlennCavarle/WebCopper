Class {
	#name : #WCEventListener,
	#superclass : #Object,
	#category : #'WebCopper-EventDispatcher'
}

{ #category : #converting }
WCEventListener >> asWCEventListener [
	^ self
]

{ #category : #'event handling' }
WCEventListener >> handleEvent: anEvent [
	self subclassResponsibility 
]
