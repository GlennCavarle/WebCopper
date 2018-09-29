Class {
	#name : #AKEventStore,
	#superclass : #Object,
	#category : #'Alkalin-Ubiq-EventStore'
}

{ #category : #public }
AKEventStore >> appendEvents: anEventCollection [
	self subclassResponsibility 
]

{ #category : #public }
AKEventStore >> loadEventsById: anId [
	self subclassResponsibility 
]
