Class {
	#name : #AKAggregateRoot,
	#superclass : #Object,
	#instVars : [
		'id',
		'version',
		'recordedEvents'
	],
	#category : #'Alkalin-Ubiq-EventSourcing'
}

{ #category : #'instance creation' }
AKAggregateRoot class >> fromHistory: anEventCollection [
	^ self new replay: anEventCollection
]

{ #category : #'as yet unclassified' }
AKAggregateRoot >> apply: anEvent [
	self perform: anEvent asSelector withEnoughArguments: {anEvent}
]

{ #category : #accessing }
AKAggregateRoot >> id [
	^ id
]

{ #category : #initialization }
AKAggregateRoot >> initialize [
	super initialize.
	version := 0.
	recordedEvents := OrderedCollection new.
]

{ #category : #accessing }
AKAggregateRoot >> popRecordedEvents [
	| removedEvents |
	removedEvents := recordedEvents copy.
	recordedEvents removeAll.
	^ removedEvents
]

{ #category : #'as yet unclassified' }
AKAggregateRoot >> recordThat: anEvent [
	version := version +1.
	recordedEvents add: (anEvent withVersion:version).
	self apply: anEvent
]

{ #category : #accessing }
AKAggregateRoot >> recordedEvents [
	^ recordedEvents
]

{ #category : #'as yet unclassified' }
AKAggregateRoot >> replay: anEventCollection [
	anEventCollection do: [ :anEvent | 
			version := anEvent version.
			self apply: anEvent ]
]

{ #category : #accessing }
AKAggregateRoot >> version [
	^ version
]
