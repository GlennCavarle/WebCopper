Class {
	#name : #WCRouteNotFound,
	#superclass : #WCRequestRoutingException,
	#category : #'WebCopper-HttpRouter-Exception'
}

{ #category : #signalling }
WCRouteNotFound class >> signalForRequest: aRequest [
	self new
		request: aRequest;
		signal: ('No route found for request "{1}"' format: {aRequest asString})
]
