Class {
	#name : #WCEventSourcingRepository,
	#superclass : #Object,
	#instVars : [
		'eventStore',
		'aggregateRootClass'
	],
	#category : #'WebCopper-Ubiq-EventSourcing'
}

{ #category : #'instance creation' }
WCEventSourcingRepository class >> forClass: anAggregateClass eventStore: anEventStore [
	^ self new
		aggregateRootClass: anAggregateClass;
		eventStore: anEventStore
]

{ #category : #private }
WCEventSourcingRepository >> aggregateRootClass: aClass [
	aggregateRootClass := aClass
]

{ #category : #private }
WCEventSourcingRepository >> eventStore: anEventStore [
	eventStore := anEventStore
]

{ #category : #public }
WCEventSourcingRepository >> getById: anId [
	| events |
	events := eventStore loadEventsById: anId.
	events ifEmpty: [ WCAggregateNotFoundException signalForId: anId ].
	^ aggregateRootClass fromHistory: events
]

{ #category : #initialization }
WCEventSourcingRepository >> initialize [
	super initialize.
]

{ #category : #public }
WCEventSourcingRepository >> save: anAggregateRoot [
	eventStore appendEvents: anAggregateRoot popRecordedEvents 
]
