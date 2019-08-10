Class {
	#name : #WCHandlerNotFound,
	#superclass : #WCException,
	#category : #'WebCopper-Ubiq-Exception'
}

{ #category : #signalling }
WCHandlerNotFound class >> signalForMessage: aMessage [
	^ self signal: ('Handler for message "{1}" not found' format: {aMessage class})
]
