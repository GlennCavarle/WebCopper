Class {
	#name : #WCTestUserEvent,
	#superclass : #WCAggregateChangedEvent,
	#category : #'WebCopper-Ubiq-Tests-EventSourcing'
}

{ #category : #converting }
WCTestUserEvent >> asSelector [
	^ ('apply' , (self className copyFrom: 7 to: self className size - 5)) asSymbol asMutator 
]
