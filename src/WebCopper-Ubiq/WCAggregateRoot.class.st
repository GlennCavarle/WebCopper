Class {
	#name : #WCAggregateRoot,
	#superclass : #Object,
	#instVars : [
		'id',
		'version',
		'recordedEvents'
	],
	#category : #'WebCopper-Ubiq-EventSourcing'
}

{ #category : #'instance creation' }
WCAggregateRoot class >> fromHistory: anEventCollection [
	^ self new replay: anEventCollection
]

{ #category : #'as yet unclassified' }
WCAggregateRoot >> apply: anEvent [
	self perform: anEvent asSelector withEnoughArguments: {anEvent}
]

{ #category : #accessing }
WCAggregateRoot >> id [
	^ id
]

{ #category : #initialization }
WCAggregateRoot >> initialize [
	super initialize.
	version := 0.
	recordedEvents := OrderedCollection new.
]

{ #category : #accessing }
WCAggregateRoot >> popRecordedEvents [
	| removedEvents |
	removedEvents := recordedEvents copy.
	recordedEvents removeAll.
	^ removedEvents
]

{ #category : #'as yet unclassified' }
WCAggregateRoot >> recordThat: anEvent [
	version := version +1.
	recordedEvents add: (anEvent withVersion:version).
	self apply: anEvent
]

{ #category : #accessing }
WCAggregateRoot >> recordedEvents [
	^ recordedEvents
]

{ #category : #'as yet unclassified' }
WCAggregateRoot >> replay: anEventCollection [
	anEventCollection do: [ :anEvent | 
			version := anEvent version.
			self apply: anEvent ]
]

{ #category : #accessing }
WCAggregateRoot >> version [
	^ version
]
