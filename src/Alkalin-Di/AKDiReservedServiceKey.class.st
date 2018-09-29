Class {
	#name : #AKDiReservedServiceKey,
	#superclass : #AKDiException,
	#category : #'Alkalin-Di-Exception'
}

{ #category : #signalling }
AKDiReservedServiceKey class >> signalForKey: aServiceKey [
	^ self signal: ('Service identifier "{1}" is reserved and cannot be set' format: {aServiceKey})
]
