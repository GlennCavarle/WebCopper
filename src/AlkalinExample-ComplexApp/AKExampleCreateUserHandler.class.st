Class {
	#name : #AKExampleCreateUserHandler,
	#superclass : #AKMessageHandler,
	#category : #'AlkalinExample-ComplexApp-Command'
}

{ #category : #accessing }
AKExampleCreateUserHandler >> handle: aCommand [
	Transcript crShow: aCommand username asString.
	
]
