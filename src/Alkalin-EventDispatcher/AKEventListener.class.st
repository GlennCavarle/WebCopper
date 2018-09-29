Class {
	#name : #AKEventListener,
	#superclass : #Object,
	#category : #'Alkalin-EventDispatcher'
}

{ #category : #converting }
AKEventListener >> asAKEventListener [
	^ self
]

{ #category : #'event handling' }
AKEventListener >> handleEvent: anEvent [
	self subclassResponsibility 
]
