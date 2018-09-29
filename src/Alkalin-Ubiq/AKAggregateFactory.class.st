Class {
	#name : #AKAggregateFactory,
	#superclass : #Object,
	#category : #'Alkalin-Ubiq-EventSourcing'
}

{ #category : #'as yet unclassified' }
AKAggregateFactory >> create: aClass fromEvents: anEventCollection [
	^ aClass fromHistory: anEventCollection
]
