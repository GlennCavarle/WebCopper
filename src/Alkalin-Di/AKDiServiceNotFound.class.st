Class {
	#name : #AKDiServiceNotFound,
	#superclass : #AKDiException,
	#category : #'Alkalin-Di-Exception'
}

{ #category : #signalling }
AKDiServiceNotFound class >> signalForKey: aServiceKey [
	^ self signal: ('Service identifier "{1}" not found' format: {aServiceKey})
]
