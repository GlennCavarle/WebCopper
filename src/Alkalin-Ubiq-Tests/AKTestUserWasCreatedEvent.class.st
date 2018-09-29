Class {
	#name : #AKTestUserWasCreatedEvent,
	#superclass : #AKTestUserEvent,
	#instVars : [
		'username'
	],
	#category : #'Alkalin-Ubiq-Tests-EventSourcing'
}

{ #category : #accessing }
AKTestUserWasCreatedEvent class >> id: aUserId username: aString [
	^ self new
		id: aUserId;
		username: aString
]

{ #category : #accessing }
AKTestUserWasCreatedEvent >> username [
	^ username
]

{ #category : #private }
AKTestUserWasCreatedEvent >> username: anObject [
	username := anObject
]
