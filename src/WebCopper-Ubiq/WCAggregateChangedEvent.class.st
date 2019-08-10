Class {
	#name : #WCAggregateChangedEvent,
	#superclass : #WCDomainEvent,
	#instVars : [
		'id',
		'version'
	],
	#category : #'WebCopper-Ubiq-EventSourcing'
}

{ #category : #comparing }
WCAggregateChangedEvent >> = aDomainEvent [
	^ (self class = aDomainEvent class and: [ self id = aDomainEvent id ])
		and: [ self version = aDomainEvent version ]
]

{ #category : #converting }
WCAggregateChangedEvent >> asSelector [
	self subclassResponsibility 
]

{ #category : #accessing }
WCAggregateChangedEvent >> id [
	^ id
]

{ #category : #private }
WCAggregateChangedEvent >> id: anUuid [
	id := anUuid
]

{ #category : #accessing }
WCAggregateChangedEvent >> version [
	^ version
]

{ #category : #private }
WCAggregateChangedEvent >> version: aNumber [ 
	version := aNumber
]

{ #category : #private }
WCAggregateChangedEvent >> withVersion: aNumber [
	^ self clone version: aNumber
]
