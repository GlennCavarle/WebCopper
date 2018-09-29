Class {
	#name : #AKTestUserEvent,
	#superclass : #AKAggregateChangedEvent,
	#category : #'Alkalin-Ubiq-Tests-EventSourcing'
}

{ #category : #converting }
AKTestUserEvent >> asSelector [
	^ ('apply' , (self className copyFrom: 7 to: self className size - 5)) asSymbol asMutator 
]
