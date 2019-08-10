Class {
	#name : #WCExampleUsernameWasChangedEvent,
	#superclass : #WCExampleEvent,
	#instVars : [
		'username'
	],
	#category : #'WebCopperExample-ComplexApp-Event'
}

{ #category : #accessing }
WCExampleUsernameWasChangedEvent class >> id: aUserId username: aString [
	^ self new 
		id: aUserId;
		username: aString
]

{ #category : #accessing }
WCExampleUsernameWasChangedEvent >> username [
	^ username
]

{ #category : #accessing }
WCExampleUsernameWasChangedEvent >> username: anObject [
	username := anObject
]
