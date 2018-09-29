Class {
	#name : #AKHandlerNotFound,
	#superclass : #AKException,
	#category : #'Alkalin-Ubiq-Exception'
}

{ #category : #signalling }
AKHandlerNotFound class >> signalForMessage: aMessage [
	^ self signal: ('Handler for message "{1}" not found' format: {aMessage class})
]
