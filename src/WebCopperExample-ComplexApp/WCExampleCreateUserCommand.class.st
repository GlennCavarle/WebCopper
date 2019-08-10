Class {
	#name : #WCExampleCreateUserCommand,
	#superclass : #WCCommand,
	#instVars : [
		'id',
		'username'
	],
	#category : #'WebCopperExample-ComplexApp-Command'
}

{ #category : #accessing }
WCExampleCreateUserCommand >> id [
	^ id
]

{ #category : #accessing }
WCExampleCreateUserCommand >> id: anObject [
	id := anObject
]

{ #category : #accessing }
WCExampleCreateUserCommand >> username [
	^ username
]

{ #category : #accessing }
WCExampleCreateUserCommand >> username: anObject [
	username := anObject
]
