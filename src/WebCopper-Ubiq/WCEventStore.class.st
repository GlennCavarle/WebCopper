Class {
	#name : #WCEventStore,
	#superclass : #Object,
	#category : #'WebCopper-Ubiq-EventStore'
}

{ #category : #public }
WCEventStore >> appendEvents: anEventCollection [
	self subclassResponsibility 
]

{ #category : #public }
WCEventStore >> loadEventsById: anId [
	self subclassResponsibility 
]
