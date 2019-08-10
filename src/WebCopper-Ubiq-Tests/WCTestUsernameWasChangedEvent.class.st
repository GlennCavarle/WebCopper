Class {
	#name : #WCTestUsernameWasChangedEvent,
	#superclass : #WCTestUserEvent,
	#instVars : [
		'username'
	],
	#category : #'WebCopper-Ubiq-Tests-EventSourcing'
}

{ #category : #accessing }
WCTestUsernameWasChangedEvent class >> id: aUserId username: aString [
	^ self new
		id: aUserId;
		username: aString
]

{ #category : #accessing }
WCTestUsernameWasChangedEvent >> username [
	^ username
]

{ #category : #private }
WCTestUsernameWasChangedEvent >> username: anObject [
	username := anObject
]
