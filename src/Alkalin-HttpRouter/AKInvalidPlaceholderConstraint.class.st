Class {
	#name : #AKInvalidPlaceholderConstraint,
	#superclass : #AKRoutingException,
	#category : #'Alkalin-HttpRouter-Exception'
}

{ #category : #signalling }
AKInvalidPlaceholderConstraint class >> signalForConstraint: aString [
	^ self signal: ('Invalid placeholder constraint "{1}"' format: {aString})
]
