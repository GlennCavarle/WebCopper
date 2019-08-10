"
Base class for User management
"
Class {
	#name : #WCUser,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'roles'
	],
	#category : #'WebCopper-Authentication-UserProvider'
}

{ #category : #'instance creation' }
WCUser class >> username: aUsername password: aPwd [
	^ self username: aUsername password: aPwd roles: #()
]

{ #category : #'instance creation' }
WCUser class >> username: aUsername password: aPwd roles: anArray [
	^ self new
		username: aUsername;
		password: aPwd;
		roles: anArray;
		yourself
]

{ #category : #accessing }
WCUser >> password [
	^ password
]

{ #category : #accessing }
WCUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
WCUser >> roles [
	^ roles
]

{ #category : #accessing }
WCUser >> roles: anObject [
	roles := anObject
]

{ #category : #accessing }
WCUser >> username [
	^ username
]

{ #category : #accessing }
WCUser >> username: anObject [
	username := anObject
]
