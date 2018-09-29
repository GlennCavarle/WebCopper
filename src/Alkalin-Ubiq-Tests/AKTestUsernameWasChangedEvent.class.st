Class {
	#name : #AKTestUsernameWasChangedEvent,
	#superclass : #AKTestUserEvent,
	#instVars : [
		'username'
	],
	#category : #'Alkalin-Ubiq-Tests-EventSourcing'
}

{ #category : #accessing }
AKTestUsernameWasChangedEvent class >> id: aUserId username: aString [
	^ self new
		id: aUserId;
		username: aString
]

{ #category : #accessing }
AKTestUsernameWasChangedEvent >> username [
	^ username
]

{ #category : #private }
AKTestUsernameWasChangedEvent >> username: anObject [
	username := anObject
]
