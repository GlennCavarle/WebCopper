Class {
	#name : #WCTestScenario,
	#superclass : #Object,
	#instVars : [
		'aggregateId',
		'eventStore',
		'testCase',
		'commandHandler'
	],
	#category : #'WebCopper-Ubiq-Testing'
}

{ #category : #tests }
WCTestScenario class >> testCase: aTestCase commandHandler: aCommandHandler [
	^ self new
		testCase: aTestCase;
		commandHandler: aCommandHandler;
		yourself
]

{ #category : #tests }
WCTestScenario class >> testCase: aTestCase eventStore: anEventStore [ 
	^ self new
		testCase: aTestCase;
		eventStore: anEventStore;
		yourself
]

{ #category : #tests }
WCTestScenario class >> testCase: aTestCase eventStore: anEventStore commandHandler: aCommandHandler [
	^ self new
		testCase: aTestCase;
		eventStore: anEventStore;
		commandHandler: aCommandHandler;
		yourself
]

{ #category : #accessing }
WCTestScenario >> aggregateId [
	^ aggregateId
]

{ #category : #accessing }
WCTestScenario >> commandHandler: aCommandHandler [
	commandHandler := aCommandHandler
]

{ #category : #accessing }
WCTestScenario >> eventStore: anEventStore [
	eventStore := anEventStore
]

{ #category : #scripting }
WCTestScenario >> given: anEventCollection [
	
	eventStore appendEvents: anEventCollection
]

{ #category : #initialization }
WCTestScenario >> initialize [
	super initialize.
	eventStore := WCInMemoryEventStore new.
	
]

{ #category : #accessing }
WCTestScenario >> testCase: anObject [
	testCase := anObject
]

{ #category : #scripting }
WCTestScenario >> then: aCollectionOfEvents [
	
	(eventStore loadEventsById: aggregateId ) with: aCollectionOfEvents do:[:a :b|
		testCase assert: a = b
		].
	
]

{ #category : #scripting }
WCTestScenario >> when: aCommand [
	commandHandler handle: aCommand
]

{ #category : #scripting }
WCTestScenario >> withAggregateId: anId [
	aggregateId := anId
]
