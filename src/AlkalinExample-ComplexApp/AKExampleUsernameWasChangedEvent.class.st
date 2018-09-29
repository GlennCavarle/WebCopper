Class {
	#name : #AKExampleUsernameWasChangedEvent,
	#superclass : #AKExampleEvent,
	#instVars : [
		'username'
	],
	#category : #'AlkalinExample-ComplexApp-Event'
}

{ #category : #accessing }
AKExampleUsernameWasChangedEvent class >> id: aUserId username: aString [
	^ self new 
		id: aUserId;
		username: aString
]

{ #category : #accessing }
AKExampleUsernameWasChangedEvent >> username [
	^ username
]

{ #category : #accessing }
AKExampleUsernameWasChangedEvent >> username: anObject [
	username := anObject
]
