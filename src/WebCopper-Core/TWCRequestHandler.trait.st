"
I define the default API of an abstract request handler
"
Trait {
	#name : #TWCRequestHandler,
	#category : #'WebCopper-Core-Utils'
}

{ #category : #'request handling' }
TWCRequestHandler >> handleRequest: aAKHttpRequest [
	self explicitRequirement
]

{ #category : #'registration hooks' }
TWCRequestHandler >> registredAtPrefix: aPrefix [
	"hook called when the handler is registred at a specific path prefix"
]
