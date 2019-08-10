Class {
	#name : #WCTestEventSubscriber,
	#superclass : #WCEventSubscriber,
	#instVars : [
		'firstBlock',
		'secondBlock'
	],
	#category : #'WebCopper-EventDispatcher-Tests'
}

{ #category : #'event handling' }
WCTestEventSubscriber >> doFirst: anEvent [
	firstBlock value: anEvent
]

{ #category : #'event handling' }
WCTestEventSubscriber >> doSecond: anEvent [
	secondBlock value: anEvent
]

{ #category : #accessing }
WCTestEventSubscriber >> firstBlock: anObject [
	firstBlock := anObject
]

{ #category : #accessing }
WCTestEventSubscriber >> secondBlock: anObject [
	secondBlock := anObject
]

{ #category : #accessing }
WCTestEventSubscriber >> subscriptions [
	^ { 
			WCEventSubscription eventClass: WCEvent selector: #doFirst priority: 10.
			WCEventSubscription eventClass: WCEvent selector: #doSecond priority: 5
	 }
]
