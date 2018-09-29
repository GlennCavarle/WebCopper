Class {
	#name : #AKRouteNotFound,
	#superclass : #AKRequestRoutingException,
	#category : #'Alkalin-HttpRouter-Exception'
}

{ #category : #signalling }
AKRouteNotFound class >> signalForRequest: aRequest [
	self new
		request: aRequest;
		signal: ('No route found for request "{1}"' format: {aRequest asString})
]
