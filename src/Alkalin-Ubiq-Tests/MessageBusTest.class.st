Class {
	#name : #MessageBusTest,
	#superclass : #TestCase,
	#category : #'Alkalin-Ubiq-Tests'
}

{ #category : #tests }
MessageBusTest >> test [
	| bus handlermw handler message |
	
	
	handler := AKDummyHandler new.
	handlermw := AKHandlerMiddleware new.
	handlermw map: AKDummyMessage to: handler.
	
	bus := AKMessageBus new.
	bus addMiddleware: handlermw.
	
	message := AKDummyMessage new.
	handler callback: [ :aMess | self assert: aMess == message ].
	bus dispatch: message.
	
	self assert: handler wasCalled
]
