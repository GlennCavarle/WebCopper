Class {
	#name : #MessageBusTest,
	#superclass : #TestCase,
	#category : #'WebCopper-Ubiq-Tests'
}

{ #category : #tests }
MessageBusTest >> test [
	| bus handlermw handler message |
	
	
	handler := WCDummyHandler new.
	handlermw := WCHandlerMiddleware new.
	handlermw map: WCDummyMessage to: handler.
	
	bus := WCMessageBus new.
	bus addMiddleware: handlermw.
	
	message := WCDummyMessage new.
	handler callback: [ :aMess | self assert: aMess == message ].
	bus dispatch: message.
	
	self assert: handler wasCalled
]
