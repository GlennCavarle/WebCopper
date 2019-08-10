Class {
	#name : #WCExampleUserWasCreatedEvent,
	#superclass : #WCExampleEvent,
	#instVars : [
		'username'
	],
	#category : #'WebCopperExample-ComplexApp-Event'
}

{ #category : #accessing }
WCExampleUserWasCreatedEvent class >> id: aUserId username: aString [
	^ self new 
		id: aUserId;
		username: aString
]

{ #category : #accessing }
WCExampleUserWasCreatedEvent >> username [
	^ username
]

{ #category : #accessing }
WCExampleUserWasCreatedEvent >> username: anObject [
	username := anObject
]
