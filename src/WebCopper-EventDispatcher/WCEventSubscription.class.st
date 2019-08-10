Class {
	#name : #WCEventSubscription,
	#superclass : #WCEventListener,
	#instVars : [
		'subscriber',
		'eventClass',
		'selector',
		'priority'
	],
	#category : #'WebCopper-EventDispatcher'
}

{ #category : #'instance creation' }
WCEventSubscription class >> eventClass: anEventClass selector: aSelector [
	^ self eventClass: anEventClass selector: aSelector priority: 0
]

{ #category : #'instance creation' }
WCEventSubscription class >> eventClass: anEventClass selector: aSelector priority: aPriority [
	^ super new
		eventClass: anEventClass;
		selector: aSelector;
		priority: aPriority;
		yourself
]

{ #category : #'instance creation' }
WCEventSubscription class >> new [
	^ self shouldNotImplement
]

{ #category : #accessing }
WCEventSubscription >> eventClass [
	^ eventClass
]

{ #category : #accessing }
WCEventSubscription >> eventClass: anObject [
	eventClass := anObject
]

{ #category : #events }
WCEventSubscription >> handleEvent: anEvent [
	subscriber perform: selector withEnoughArguments: {anEvent}
]

{ #category : #accessing }
WCEventSubscription >> priority [
	^ priority
]

{ #category : #accessing }
WCEventSubscription >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
WCEventSubscription >> selector [
	^ selector
]

{ #category : #accessing }
WCEventSubscription >> selector: anObject [
	selector := anObject asMutator
]

{ #category : #accessing }
WCEventSubscription >> subscriber [
	^ subscriber
]

{ #category : #accessing }
WCEventSubscription >> subscriber: anObject [
	subscriber := anObject
]
