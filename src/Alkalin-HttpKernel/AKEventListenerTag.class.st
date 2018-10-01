"
I am a ServiceTag
I am used to tag Event Listeners
"
Class {
	#name : #AKEventListenerTag,
	#superclass : #AKDiTag,
	#instVars : [
		'eventClass',
		'priority'
	],
	#category : #'Alkalin-HttpKernel-EventListener'
}

{ #category : #accessing }
AKEventListenerTag class >> event: aAKEventClass [
	^ self event: #aAKEventClass priority: 0
]

{ #category : #accessing }
AKEventListenerTag class >> event: aAKEventClass priority: aNumber [
	^ (self name: #eventListener)
		eventClass: aAKEventClass;
		priority: aNumber;
		yourself
]

{ #category : #accessing }
AKEventListenerTag >> eventClass [
	^ eventClass
]

{ #category : #accessing }
AKEventListenerTag >> eventClass: anObject [
	eventClass := anObject
]

{ #category : #accessing }
AKEventListenerTag >> priority [
	^ priority
]

{ #category : #accessing }
AKEventListenerTag >> priority: anObject [
	priority := anObject
]
