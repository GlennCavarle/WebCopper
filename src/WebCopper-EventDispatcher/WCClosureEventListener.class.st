Class {
	#name : #WCClosureEventListener,
	#superclass : #WCEventListener,
	#instVars : [
		'block'
	],
	#category : #'WebCopper-EventDispatcher'
}

{ #category : #enumerating }
WCClosureEventListener class >> do: aBlock [
	^ super new
		initializeWithBlock: aBlock;
		yourself
]

{ #category : #enumerating }
WCClosureEventListener class >> new [
	^ self shouldNotImplement
]

{ #category : #comparing }
WCClosureEventListener >> = aAKEventListener [
	^ self block = aAKEventListener block
]

{ #category : #accessing }
WCClosureEventListener >> block [
	^ block
]

{ #category : #'event handling' }
WCClosureEventListener >> handleEvent: anEvent [
	block cull: anEvent
]

{ #category : #initialization }
WCClosureEventListener >> initializeWithBlock: aBlock [
	block := aBlock
]
