Class {
	#name : #AKAggregateNotFoundException,
	#superclass : #Error,
	#category : #'Alkalin-Ubiq-Exception'
}

{ #category : #signalling }
AKAggregateNotFoundException class >> signalForId: anId [
	^ self signal: ('Aggregate with id "{1}" not found' format: {anId})
]
