Class {
	#name : #AKScenarioTest,
	#superclass : #TestCase,
	#category : #'Alkalin-Ubiq-Tests'
}

{ #category : #tests }
AKScenarioTest >> test [
	| es sc userId|
	userId := 1.
	es := AKInMemoryEventStore new.
	sc := AKTestScenario testCase: self eventStore: es.
	
	sc	commandHandler: (AKDummyHandler callback:[
			|repo user|
			repo := AKEventSourcingRepository forClass: AKTestUser eventStore: es.
			user := AKTestUser id: userId username: 'John Doe'.
			user updateUsername: 'Molly Adam'.
			repo save: user.
			]).
		
	sc
		withAggregateId: userId;
		given: {};
		when: AKDummyMessage new;
		then: {
			(AKTestUserWasCreatedEvent id: userId username: 'John Doe') withVersion:1.
			(AKTestUsernameWasChangedEvent id: userId username: 'Molly Adam') withVersion:2
		}
]
