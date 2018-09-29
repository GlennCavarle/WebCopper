Class {
	#name : #AKActionNotFound,
	#superclass : #AKRequestRoutingException,
	#category : #'Alkalin-HttpRouter-Exception'
}

{ #category : #signalling }
AKActionNotFound class >> signalForRequest: aRequest [
	self new
		request: aRequest;
		signal: ('No action found for request "{1}"' format: {aRequest asString})
]
