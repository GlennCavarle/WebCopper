"
I define the default API of an abstract request handler
"
Trait {
	#name : #TAKRequestHandler,
	#category : #'Alkalin-Core-Utils'
}

{ #category : #'request handling' }
TAKRequestHandler >> handleRequest: aAKHttpRequest [
	self explicitRequirement
]

{ #category : #'registration hooks' }
TAKRequestHandler >> registredAtPrefix: aPrefix [
	"hook called when the handler is registred at a specific path prefix"
]
