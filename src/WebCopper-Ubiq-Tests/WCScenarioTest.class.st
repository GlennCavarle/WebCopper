Class {
	#name : #WCScenarioTest,
	#superclass : #TestCase,
	#category : #'WebCopper-Ubiq-Tests'
}

{ #category : #tests }
WCScenarioTest >> test [
	| es sc userId|
	userId := 1.
	es := WCInMemoryEventStore new.
	sc := WCTestScenario testCase: self eventStore: es.
	
	sc	commandHandler: (WCDummyHandler callback:[
			|repo user|
			repo := WCEventSourcingRepository forClass: WCTestUser eventStore: es.
			user := WCTestUser id: userId username: 'John Doe'.
			user updateUsername: 'Molly Adam'.
			repo save: user.
			]).
		
	sc
		withAggregateId: userId;
		given: {};
		when: WCDummyMessage new;
		then: {
			(WCTestUserWasCreatedEvent id: userId username: 'John Doe') withVersion:1.
			(WCTestUsernameWasChangedEvent id: userId username: 'Molly Adam') withVersion:2
		}
]
