Class {
	#name : #WCInvalidPlaceholderConstraint,
	#superclass : #WCRoutingException,
	#category : #'WebCopper-HttpRouter-Exception'
}

{ #category : #signalling }
WCInvalidPlaceholderConstraint class >> signalForConstraint: aString [
	^ self signal: ('Invalid placeholder constraint "{1}"' format: {aString})
]
