"
I am an Event Subscriber.
I subscribe to RequestEvent.

I call the Router to retrieve the Route which match the HttpRequest
From the found Route, I populate the action which have to be performed
"
Class {
	#name : #AKRouterSubscriber,
	#superclass : #AKEventSubscriber,
	#instVars : [
		'router'
	],
	#category : #'Alkalin-HttpKernel-EventListener'
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
	request addAllAttributes: (foundRoute extractUrlParametersFrom: request).
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
	^ {(AKEventSubscription eventClass: AKKernelRequestEvent selector: #onRequest:)}
]
