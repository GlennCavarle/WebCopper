Class {
	#name : #WCExampleUser,
	#superclass : #WCAggregateRoot,
	#instVars : [
		'username'
	],
	#category : #'WebCopperExample-ComplexApp-Model'
}

{ #category : #'as yet unclassified' }
WCExampleUser class >> createWithId: aUserId andUsername: aString [
	^ super new 
		recordThat: (WCExampleUserWasCreatedEvent id: aUserId username: aString)
]

{ #category : #applying }
WCExampleUser >> applyUserWasCreated: anEvent [
	id := anEvent id.
	username := anEvent username 
]

{ #category : #applying }
WCExampleUser >> applyUsernameWasChanged: anEvent [
	username := anEvent username
]

{ #category : #updating }
WCExampleUser >> updateUsername: aString [
	self recordThat: (WCExampleUsernameWasChangedEvent id: id username: aString)
]

{ #category : #accessing }
WCExampleUser >> userId [ 
	^ id
]

{ #category : #accessing }
WCExampleUser >> username [ 
	^ username
]
