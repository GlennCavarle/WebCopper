Class {
	#name : #WCDiServiceNotFound,
	#superclass : #WCDiException,
	#category : #'WebCopper-Di-Exception'
}

{ #category : #signalling }
WCDiServiceNotFound class >> signalForKey: aServiceKey [
	^ self signal: ('Service identifier "{1}" not found' format: {aServiceKey})
]
