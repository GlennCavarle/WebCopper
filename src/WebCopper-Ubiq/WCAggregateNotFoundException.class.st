Class {
	#name : #WCAggregateNotFoundException,
	#superclass : #Error,
	#category : #'WebCopper-Ubiq-Exception'
}

{ #category : #signalling }
WCAggregateNotFoundException class >> signalForId: anId [
	^ self signal: ('Aggregate with id "{1}" not found' format: {anId})
]
