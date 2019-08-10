Class {
	#name : #WCComplexExampleController,
	#superclass : #WCUbiqController,
	#category : #'WebCopperExample-ComplexApp-Controller'
}

{ #category : #'as yet unclassified' }
WCComplexExampleController >> doCreateUser: aRequest [
	|data cmd |
	data := NeoJSONReader fromString: aRequest entity contents.
	cmd := WCExampleCreateUserCommand new
		id: UUID new;
		username: (data at: #username).
	
	[ self commandBus dispatch: cmd ]
		on: Error
		do: [ ^ WCHttpResponse badRequest body: {(#error -> 'user not created')} asDictionary ].
		
	^ {(#message -> 'user created')} asDictionary
]
