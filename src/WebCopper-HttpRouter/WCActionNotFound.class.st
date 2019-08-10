Class {
	#name : #WCActionNotFound,
	#superclass : #WCRequestRoutingException,
	#category : #'WebCopper-HttpRouter-Exception'
}

{ #category : #signalling }
WCActionNotFound class >> signalForRequest: aRequest [
	self new
		request: aRequest;
		signal: ('No action found for request "{1}"' format: {aRequest asString})
]
