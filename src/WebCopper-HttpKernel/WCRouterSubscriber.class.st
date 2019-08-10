"
I am an Event Subscriber.
I subscribe to RequestEvent.

I call the Router to retrieve the Route which match the HttpRequest
From the found Route, I populate the action which have to be performed
"
Class {
	#name : #WCRouterSubscriber,
	#superclass : #WCEventSubscriber,
	#instVars : [
		'router'
	],
	#category : #'WebCopper-HttpKernel-EventListener'
}

{ #category : #accessing }
WCRouterSubscriber class >> router: aAKRouter [
	^ self new
		router: aAKRouter;
		yourself
]

{ #category : #'event handling' }
WCRouterSubscriber >> onRequest: aAKRequestEvent [
	|request foundRoute|
	request := aAKRequestEvent request.
	foundRoute := self router routeForRequest: request.
	request addAllAttributes: (foundRoute extractUrlParametersFrom: request).
	aAKRequestEvent action: foundRoute action
]

{ #category : #accessing }
WCRouterSubscriber >> router [
	^ router
]

{ #category : #accessing }
WCRouterSubscriber >> router: anObject [
	router := anObject
]

{ #category : #accessing }
WCRouterSubscriber >> subscriptions [
	^ {(WCEventSubscription eventClass: WCKernelRequestEvent selector: #onRequest:)}
]
