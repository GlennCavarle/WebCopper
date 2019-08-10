Class {
	#name : #WCAggregateFactory,
	#superclass : #Object,
	#category : #'WebCopper-Ubiq-EventSourcing'
}

{ #category : #'as yet unclassified' }
WCAggregateFactory >> create: aClass fromEvents: anEventCollection [
	^ aClass fromHistory: anEventCollection
]
