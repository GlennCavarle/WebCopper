Class {
	#name : #AKEventSubscription,
	#superclass : #AKEventListener,
	#instVars : [
		'subscriber',
		'eventClass',
		'selector',
		'priority'
	],
	#category : #'Alkalin-EventDispatcher'
}

{ #category : #'instance creation' }
AKEventSubscription class >> eventClass: anEventClass selector: aSelector [
	^ self eventClass: anEventClass selector: aSelector priority: 0
]

{ #category : #'instance creation' }
AKEventSubscription class >> eventClass: anEventClass selector: aSelector priority: aPriority [
	^ super new
		eventClass: anEventClass;
		selector: aSelector;
		priority: aPriority;
		yourself
]

{ #category : #'instance creation' }
AKEventSubscription class >> new [
	^ self shouldNotImplement
]

{ #category : #accessing }
AKEventSubscription >> eventClass [
	^ eventClass
]

{ #category : #accessing }
AKEventSubscription >> eventClass: anObject [
	eventClass := anObject
]

{ #category : #events }
AKEventSubscription >> handleEvent: anEvent [
	subscriber perform: selector withEnoughArguments: {anEvent}
]

{ #category : #accessing }
AKEventSubscription >> priority [
	^ priority
]

{ #category : #accessing }
AKEventSubscription >> priority: anObject [
	priority := anObject
]

{ #category : #accessing }
AKEventSubscription >> selector [
	^ selector
]

{ #category : #accessing }
AKEventSubscription >> selector: anObject [
	selector := anObject asMutator
]

{ #category : #accessing }
AKEventSubscription >> subscriber [
	^ subscriber
]

{ #category : #accessing }
AKEventSubscription >> subscriber: anObject [
	subscriber := anObject
]
