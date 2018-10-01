Class {
	#name : #AKUser,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'roles'
	],
	#category : #'Alkalin-Authentication-UserProvider'
}

{ #category : #'instance creation' }
AKUser class >> username: aUsername password: aPwd [
	^ self username: aUsername password: aPwd roles: #()
]

{ #category : #'instance creation' }
AKUser class >> username: aUsername password: aPwd roles: anArray [
	^ self new
		username: aUsername;
		password: aPwd;
		roles: anArray;
		yourself
]

{ #category : #accessing }
AKUser >> password [
	^ password
]

{ #category : #accessing }
AKUser >> password: anObject [
	password := anObject
]

{ #category : #accessing }
AKUser >> roles [
	^ roles
]

{ #category : #accessing }
AKUser >> roles: anObject [
	roles := anObject
]

{ #category : #accessing }
AKUser >> username [
	^ username
]

{ #category : #accessing }
AKUser >> username: anObject [
	username := anObject
]
