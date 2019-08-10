Class {
	#name : #WCExampleEvent,
	#superclass : #WCAggregateChangedEvent,
	#category : #'WebCopperExample-ComplexApp-Event'
}

{ #category : #converting }
WCExampleEvent >> asSelector [
	^ 'apply' , (self className copyFrom: 10 to: self className size - 5) asSymbol asMutator 
]
