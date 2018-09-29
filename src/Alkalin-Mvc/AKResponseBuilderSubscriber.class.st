Class {
	#name : #AKResponseBuilderSubscriber,
	#superclass : #AKEventSubscriber,
	#category : #'Alkalin-Mvc-EventListener'
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
	^ {(AKEventSubscription eventClass: AKMvcResponseFromResultEvent selector: #onActionResult:)}
]
