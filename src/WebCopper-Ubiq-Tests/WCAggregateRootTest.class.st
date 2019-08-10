Class {
	#name : #WCAggregateRootTest,
	#superclass : #TestCase,
	#category : #'WebCopper-Ubiq-Tests-EventSourcing'
}

{ #category : #tests }
WCAggregateRootTest >> testCreationShouldRecordAnEvent [
	| user userId |
	userId := UUID new.
	user := WCTestUser id: userId username: 'John Doe'.
	
	self assert: user id = userId.
	self assert: user username = 'John Doe'.
	self assert: user recordedEvents size = 1.
]

{ #category : #tests }
WCAggregateRootTest >> testReplayedEventsShouldBeAppliedButNotBeRecorded [
	| eventsToReplay user userId |
	
	userId := UUID new.
	eventsToReplay := { 
		(WCTestUserWasCreatedEvent id:userId username: 'John Doe') withVersion:1.
		(WCTestUsernameWasChangedEvent id:userId username: 'Molly Adam') withVersion:2.
	}.
	user := WCTestUser fromHistory: eventsToReplay.
	
	self assert: user id = userId.
	self assert: user username = 'Molly Adam'.
	self assert: user version = 2.
	self assert: user recordedEvents size = 0 description: 'Replayed events should not be recorded'.
	
]

{ #category : #tests }
WCAggregateRootTest >> testUpdatingModelShouldRecordAnEvent [
	| user userId |
	userId := UUID new.
	user := WCTestUser id: userId username: 'John Doe'.
	user updateUsername: 'Molly Adam'.
	
	self assert: user username = 'Molly Adam'.
	self assert: user recordedEvents size = 2.
]

{ #category : #tests }
WCAggregateRootTest >> testVersionShouldBeIncAfterChanges [
	| user userId |
	userId := UUID new.
	user := WCTestUser id: userId username: 'John Doe'.
	self assert: user version = 1.
	
	user updateUsername: 'Molly Adam'.
	self assert: user version = 2.
]

{ #category : #tests }
WCAggregateRootTest >> testVersionShouldBeUpToDateAfterReplayedEvents [
	| eventsToReplay user userId |
	
	userId := UUID new.
	eventsToReplay := { 
		(WCTestUserWasCreatedEvent id:userId username: 'John Doe') withVersion:1.
		(WCTestUsernameWasChangedEvent id:userId username: 'Molly Adam') withVersion:2.
	}.
	user := WCTestUser fromHistory: eventsToReplay.
	
	self assert: user version = 2.
	
]
