Class {
	#name : #AKInMemoryEventStore,
	#superclass : #AKEventStore,
	#instVars : [
		'events'
	],
	#category : #'Alkalin-Ubiq-EventStore'
}

{ #category : #public }
AKInMemoryEventStore >> appendEvents: anEventCollection [
	events addAll: anEventCollection
]

{ #category : #initialization }
AKInMemoryEventStore >> initialize [
	super initialize.
	events := OrderedCollection new
]

{ #category : #public }
AKInMemoryEventStore >> loadEventsById: anId [
	^ events select:[:each| each id = anId] 
]
