Class {
	#name : #AKRouterSubscriber,
	#superclass : #AKEventSubscriber,
	#instVars : [
		'router'
	],
	#category : #'Alkalin-Mvc-EventListener'
}

{ #category : #accessing }
AKRouterSubscriber class >> router: aAKRouter [
	^ self new
		router: aAKRouter;
		yourself
]

{ #category : #'event handling' }
AKRouterSubscriber >> onRequest: aAKRequestEvent [
	|request foundRoute|
	request := aAKRequestEvent request.
	foundRoute := self router routeForRequest: request.
	request addAllAttributes: (foundRoute pathParametersFrom: request).
	aAKRequestEvent action: foundRoute action
]

{ #category : #accessing }
AKRouterSubscriber >> router [
	^ router
]

{ #category : #accessing }
AKRouterSubscriber >> router: anObject [
	router := anObject
]

{ #category : #accessing }
AKRouterSubscriber >> subscriptions [
	^ {(AKEventSubscription eventClass: AKMvcRequestEvent selector: #onRequest:)}
]
