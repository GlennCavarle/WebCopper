Class {
	#name : #WCTestUserWasCreatedEvent,
	#superclass : #WCTestUserEvent,
	#instVars : [
		'username'
	],
	#category : #'WebCopper-Ubiq-Tests-EventSourcing'
}

{ #category : #accessing }
WCTestUserWasCreatedEvent class >> id: aUserId username: aString [
	^ self new
		id: aUserId;
		username: aString
]

{ #category : #accessing }
WCTestUserWasCreatedEvent >> username [
	^ username
]

{ #category : #private }
WCTestUserWasCreatedEvent >> username: anObject [
	username := anObject
]
