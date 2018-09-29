Class {
	#name : #AKTestEventSubscriber,
	#superclass : #AKEventSubscriber,
	#instVars : [
		'firstBlock',
		'secondBlock'
	],
	#category : #'Alkalin-EventDispatcher-Tests'
}

{ #category : #'event handling' }
AKTestEventSubscriber >> doFirst: anEvent [
	firstBlock value: anEvent
]

{ #category : #'event handling' }
AKTestEventSubscriber >> doSecond: anEvent [
	secondBlock value: anEvent
]

{ #category : #accessing }
AKTestEventSubscriber >> firstBlock: anObject [
	firstBlock := anObject
]

{ #category : #accessing }
AKTestEventSubscriber >> secondBlock: anObject [
	secondBlock := anObject
]

{ #category : #accessing }
AKTestEventSubscriber >> subscriptions [
	^ { 
			AKEventSubscription eventClass: AKEvent selector: #doFirst priority: 10.
			AKEventSubscription eventClass: AKEvent selector: #doSecond priority: 5
	 }
]
