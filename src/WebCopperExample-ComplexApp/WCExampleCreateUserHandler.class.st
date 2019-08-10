Class {
	#name : #WCExampleCreateUserHandler,
	#superclass : #WCMessageHandler,
	#category : #'WebCopperExample-ComplexApp-Command'
}

{ #category : #accessing }
WCExampleCreateUserHandler >> handle: aCommand [
	Transcript crShow: aCommand username asString.
	
]
