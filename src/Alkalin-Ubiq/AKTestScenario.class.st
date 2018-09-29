Class {
	#name : #AKTestScenario,
	#superclass : #Object,
	#instVars : [
		'aggregateId',
		'eventStore',
		'testCase',
		'commandHandler'
	],
	#category : #'Alkalin-Ubiq-Testing'
}

{ #category : #tests }
AKTestScenario class >> testCase: aTestCase commandHandler: aCommandHandler [
	^ self new
		testCase: aTestCase;
		commandHandler: aCommandHandler;
		yourself
]

{ #category : #tests }
AKTestScenario class >> testCase: aTestCase eventStore: anEventStore [ 
	^ self new
		testCase: aTestCase;
		eventStore: anEventStore;
		yourself
]

{ #category : #tests }
AKTestScenario class >> testCase: aTestCase eventStore: anEventStore commandHandler: aCommandHandler [
	^ self new
		testCase: aTestCase;
		eventStore: anEventStore;
		commandHandler: aCommandHandler;
		yourself
]

{ #category : #accessing }
AKTestScenario >> aggregateId [
	^ aggregateId
]

{ #category : #accessing }
AKTestScenario >> commandHandler: aCommandHandler [
	commandHandler := aCommandHandler
]

{ #category : #accessing }
AKTestScenario >> eventStore: anEventStore [
	eventStore := anEventStore
]

{ #category : #scripting }
AKTestScenario >> given: anEventCollection [
	
	eventStore appendEvents: anEventCollection
]

{ #category : #initialization }
AKTestScenario >> initialize [
	super initialize.
	eventStore := AKInMemoryEventStore new.
	
]

{ #category : #accessing }
AKTestScenario >> testCase: anObject [
	testCase := anObject
]

{ #category : #scripting }
AKTestScenario >> then: aCollectionOfEvents [
	
	(eventStore loadEventsById: aggregateId ) with: aCollectionOfEvents do:[:a :b|
		testCase assert: a = b
		].
	
]

{ #category : #scripting }
AKTestScenario >> when: aCommand [
	commandHandler handle: aCommand
]

{ #category : #scripting }
AKTestScenario >> withAggregateId: anId [
	aggregateId := anId
]
