Class {
	#name : #WCDiReservedServiceKey,
	#superclass : #WCDiException,
	#category : #'WebCopper-Di-Exception'
}

{ #category : #signalling }
WCDiReservedServiceKey class >> signalForKey: aServiceKey [
	^ self signal: ('Service identifier "{1}" is reserved and cannot be set' format: {aServiceKey})
]
