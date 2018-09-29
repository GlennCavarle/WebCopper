Class {
	#name : #AKAggregateChangedEvent,
	#superclass : #AKDomainEvent,
	#instVars : [
		'id',
		'version'
	],
	#category : #'Alkalin-Ubiq-EventSourcing'
}

{ #category : #comparing }
AKAggregateChangedEvent >> = aDomainEvent [
	^ (self class = aDomainEvent class and: [ self id = aDomainEvent id ])
		and: [ self version = aDomainEvent version ]
]

{ #category : #converting }
AKAggregateChangedEvent >> asSelector [
	self subclassResponsibility 
]

{ #category : #accessing }
AKAggregateChangedEvent >> id [
	^ id
]

{ #category : #private }
AKAggregateChangedEvent >> id: anUuid [
	id := anUuid
]

{ #category : #accessing }
AKAggregateChangedEvent >> version [
	^ version
]

{ #category : #private }
AKAggregateChangedEvent >> version: aNumber [ 
	version := aNumber
]

{ #category : #private }
AKAggregateChangedEvent >> withVersion: aNumber [
	^ self clone version: aNumber
]
