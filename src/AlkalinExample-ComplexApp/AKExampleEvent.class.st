Class {
	#name : #AKExampleEvent,
	#superclass : #AKAggregateChangedEvent,
	#category : #'AlkalinExample-ComplexApp-Event'
}

{ #category : #converting }
AKExampleEvent >> asSelector [
	^ 'apply' , (self className copyFrom: 10 to: self className size - 5) asSymbol asMutator 
]
