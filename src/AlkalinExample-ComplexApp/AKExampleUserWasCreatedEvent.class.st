Class {
	#name : #AKExampleUserWasCreatedEvent,
	#superclass : #AKExampleEvent,
	#instVars : [
		'username'
	],
	#category : #'AlkalinExample-ComplexApp-Event'
}

{ #category : #accessing }
AKExampleUserWasCreatedEvent class >> id: aUserId username: aString [
	^ self new 
		id: aUserId;
		username: aString
]

{ #category : #accessing }
AKExampleUserWasCreatedEvent >> username [
	^ username
]

{ #category : #accessing }
AKExampleUserWasCreatedEvent >> username: anObject [
	username := anObject
]
