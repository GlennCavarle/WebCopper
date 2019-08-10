Class {
	#name : #WCInMemoryEventStore,
	#superclass : #WCEventStore,
	#instVars : [
		'events'
	],
	#category : #'WebCopper-Ubiq-EventStore'
}

{ #category : #public }
WCInMemoryEventStore >> appendEvents: anEventCollection [
	events addAll: anEventCollection
]

{ #category : #initialization }
WCInMemoryEventStore >> initialize [
	super initialize.
	events := OrderedCollection new
]

{ #category : #public }
WCInMemoryEventStore >> loadEventsById: anId [
	^ events select:[:each| each id = anId] 
]
