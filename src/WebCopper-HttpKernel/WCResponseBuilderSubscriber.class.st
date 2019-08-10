"
I am an Event Subscriber.
I subscribe to ResponseFromResultEvent.

I allow Action to directly return an Object as a result.
I transform an action result to an HttpResponse based on the Accept header of the request.

"
Class {
	#name : #WCResponseBuilderSubscriber,
	#superclass : #WCEventSubscriber,
	#category : #'WebCopper-HttpKernel-EventListener'
}

{ #category : #'event handling' }
WCResponseBuilderSubscriber >> onActionResult: aAKActionResultEvent [
	|request result builder|
	
	request := aAKActionResultEvent request.
	result := aAKActionResultEvent result.
	
	builder := WCHttpResponseBuilder fromContentType: request accept.
	aAKActionResultEvent response: (builder build:result) 
]

{ #category : #accessing }
WCResponseBuilderSubscriber >> subscriptions [
	^ {(WCEventSubscription eventClass: WCKernelResponseFromResultEvent selector: #onActionResult:)}
]
