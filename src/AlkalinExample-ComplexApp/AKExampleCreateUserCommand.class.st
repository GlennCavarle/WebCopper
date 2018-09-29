Class {
	#name : #AKExampleCreateUserCommand,
	#superclass : #AKCommand,
	#instVars : [
		'id',
		'username'
	],
	#category : #'AlkalinExample-ComplexApp-Command'
}

{ #category : #accessing }
AKExampleCreateUserCommand >> id [
	^ id
]

{ #category : #accessing }
AKExampleCreateUserCommand >> id: anObject [
	id := anObject
]

{ #category : #accessing }
AKExampleCreateUserCommand >> username [
	^ username
]

{ #category : #accessing }
AKExampleCreateUserCommand >> username: anObject [
	username := anObject
]
