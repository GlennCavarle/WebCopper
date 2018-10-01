"
I am an Event Subscriber.
I subscribe to ResponseFromResultEvent.

I allow Action to directly return an Object as a result.
I transform an action result to an HttpResponse based on the Accept header of the request.

"
Class {
	#name : #AKResponseBuilderSubscriber,
	#superclass : #AKEventSubscriber,
	#category : #'Alkalin-HttpKernel-EventListener'
}

{ #category : #'event handling' }
AKResponseBuilderSubscriber >> onActionResult: aAKActionResultEvent [
	|request result builder|
	
	request := aAKActionResultEvent request.
	result := aAKActionResultEvent result.
	
	builder := AKHttpResponseBuilder fromContentType: request accept.
	aAKActionResultEvent response: (builder build:result) 
]

{ #category : #accessing }
AKResponseBuilderSubscriber >> subscriptions [
	^ {(AKEventSubscription eventClass: AKKernelResponseFromResultEvent selector: #onActionResult:)}
]
