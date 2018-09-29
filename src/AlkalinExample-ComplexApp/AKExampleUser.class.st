Class {
	#name : #AKExampleUser,
	#superclass : #AKAggregateRoot,
	#instVars : [
		'username'
	],
	#category : #'AlkalinExample-ComplexApp-Model'
}

{ #category : #'as yet unclassified' }
AKExampleUser class >> createWithId: aUserId andUsername: aString [
	^ super new 
		recordThat: (AKExampleUserWasCreatedEvent id: aUserId username: aString)
]

{ #category : #applying }
AKExampleUser >> applyUserWasCreated: anEvent [
	id := anEvent id.
	username := anEvent username 
]

{ #category : #applying }
AKExampleUser >> applyUsernameWasChanged: anEvent [
	username := anEvent username
]

{ #category : #updating }
AKExampleUser >> updateUsername: aString [
	self recordThat: (AKExampleUsernameWasChangedEvent id: id username: aString)
]

{ #category : #accessing }
AKExampleUser >> userId [ 
	^ id
]

{ #category : #accessing }
AKExampleUser >> username [ 
	^ username
]
