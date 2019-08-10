Class {
	#name : #WCEventSourcingRepositoryTest,
	#superclass : #TestCase,
	#category : #'WebCopper-Ubiq-Tests-EventSourcing'
}

{ #category : #tests }
WCEventSourcingRepositoryTest >> testChangesShouldBeSaved [
	| aggRepository user userId |
	
	aggRepository := WCEventSourcingRepository
		forClass: WCTestUser
		eventStore: WCInMemoryEventStore new.
	
	userId := UUID new.
	user := WCTestUser id: userId username: 'John Doe'.
	aggRepository save: user.
	
	user := (aggRepository getById: userId).
	
	user updateUsername: 'Didier Dupont'.
	aggRepository save: user.
	
	user := (aggRepository getById: userId) .
	
	self assert: user id = userId.
	self assert: user version = 2.
	self assert: user username = 'Didier Dupont' description: 'Changes should be saved' .
]

{ #category : #tests }
WCEventSourcingRepositoryTest >> testEventsShouldBeRemovedAfterSave [
	| aggRepository user userId |
	
	aggRepository := WCEventSourcingRepository
		forClass: WCTestUser
		eventStore: WCInMemoryEventStore new.
	
	userId := UUID new.
	user := WCTestUser id: userId username: 'John Doe'.
	
	self assert:  user recordedEvents size = 1.
	aggRepository save: user.
	self assert:  user version = 1.
	self assert:  user recordedEvents size = 0 description: 'Events should be removed after #save:'.
]

{ #category : #tests }
WCEventSourcingRepositoryTest >> testGetByIdShouldReplayEvents [
	| aggRepository user userId |
	
	aggRepository := WCEventSourcingRepository
		forClass: WCTestUser
		eventStore: WCInMemoryEventStore new.
	
	userId := UUID new.
	user := WCTestUser id: userId username: 'John Doe'.
	user updateUsername: 'Didier Dupont'.
	user updateUsername: 'Molly Adam'.
	aggRepository save: user.
	
	user := (aggRepository getById: userId).
	
	self assert: user id = userId.
	self assert: user version = 3.
	self assert: user username = 'Molly Adam'.
]

{ #category : #tests }
WCEventSourcingRepositoryTest >> testReplayedEventsShouldNotBeRecorded [
	| aggRepository user userId |
	
	aggRepository := WCEventSourcingRepository
		forClass: WCTestUser
		eventStore: WCInMemoryEventStore new.
	
	userId := UUID new.
	user := WCTestUser id: userId username: 'John Doe'.
	aggRepository save: user.
	
	user := (aggRepository getById: userId).
	
	self assert: user id = userId.
	self assert: user username = 'John Doe'.
	
	user updateUsername: 'Didier Dupont'.
	aggRepository save: user.
	
	user := (aggRepository getById: userId) .
	
	self assert: user id = userId.
	self assert: user username = 'Didier Dupont' description: 'Changed should be saved' .
]
