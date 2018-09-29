Class {
	#name : #AKEventSourcingRepository,
	#superclass : #Object,
	#instVars : [
		'eventStore',
		'aggregateRootClass'
	],
	#category : #'Alkalin-Ubiq-EventSourcing'
}

{ #category : #'instance creation' }
AKEventSourcingRepository class >> forClass: anAggregateClass eventStore: anEventStore [
	^ self new
		aggregateRootClass: anAggregateClass;
		eventStore: anEventStore
]

{ #category : #private }
AKEventSourcingRepository >> aggregateRootClass: aClass [
	aggregateRootClass := aClass
]

{ #category : #private }
AKEventSourcingRepository >> eventStore: anEventStore [
	eventStore := anEventStore
]

{ #category : #public }
AKEventSourcingRepository >> getById: anId [
	| events |
	events := eventStore loadEventsById: anId.
	events ifEmpty: [ AKAggregateNotFoundException signalForId: anId ].
	^ aggregateRootClass fromHistory: events
]

{ #category : #initialization }
AKEventSourcingRepository >> initialize [
	super initialize.
]

{ #category : #public }
AKEventSourcingRepository >> save: anAggregateRoot [
	eventStore appendEvents: anAggregateRoot popRecordedEvents 
]
