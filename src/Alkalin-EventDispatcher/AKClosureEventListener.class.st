Class {
	#name : #AKClosureEventListener,
	#superclass : #AKEventListener,
	#instVars : [
		'block'
	],
	#category : #'Alkalin-EventDispatcher'
}

{ #category : #enumerating }
AKClosureEventListener class >> do: aBlock [
	^ super new
		initializeWithBlock: aBlock;
		yourself
]

{ #category : #enumerating }
AKClosureEventListener class >> new [
	^ self shouldNotImplement
]

{ #category : #comparing }
AKClosureEventListener >> = aAKEventListener [
	^ self block = aAKEventListener block
]

{ #category : #accessing }
AKClosureEventListener >> block [
	^ block
]

{ #category : #'event handling' }
AKClosureEventListener >> handleEvent: anEvent [
	block cull: anEvent
]

{ #category : #initialization }
AKClosureEventListener >> initializeWithBlock: aBlock [
	block := aBlock
]
