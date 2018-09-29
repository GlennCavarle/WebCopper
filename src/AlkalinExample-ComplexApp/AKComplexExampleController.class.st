Class {
	#name : #AKComplexExampleController,
	#superclass : #AKUbiqController,
	#category : #'AlkalinExample-ComplexApp-Controller'
}

{ #category : #'as yet unclassified' }
AKComplexExampleController >> doCreateUser: aRequest [
	|data cmd |
	data := NeoJSONReader fromString: aRequest entity contents.
	cmd := AKExampleCreateUserCommand new
		id: UUID new;
		username: (data at: #username).
	
	[ self commandBus dispatch: cmd ]
		on: Error
		do: [ ^ AKHttpResponse badRequest body: {(#error -> 'user not created')} asDictionary ].
		
	^ {(#message -> 'user created')} asDictionary
]
