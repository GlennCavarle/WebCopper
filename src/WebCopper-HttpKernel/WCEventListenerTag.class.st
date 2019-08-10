"
I am a ServiceTag
I am used to tag Event Listeners
"
Class {
	#name : #WCEventListenerTag,
	#superclass : #WCDiTag,
	#instVars : [
		'eventClass',
		'priority'
	],
	#category : #'WebCopper-HttpKernel-EventListener'
}

{ #category : #accessing }
WCEventListenerTag class >> event: aAKEventClass [
	^ self event: #aAKEventClass priority: 0
]

{ #category : #accessing }
WCEventListenerTag class >> event: aAKEventClass priority: aNumber [
	^ (self name: #eventListener)
		eventClass: aAKEventClass;
		priority: aNumber;
		yourself
]

{ #category : #accessing }
WCEventListenerTag >> eventClass [
	^ eventClass
]

{ #category : #accessing }
WCEventListenerTag >> eventClass: anObject [
	eventClass := anObject
]

{ #category : #accessing }
WCEventListenerTag >> priority [
	^ priority
]

{ #category : #accessing }
WCEventListenerTag >> priority: anObject [
	priority := anObject
]
