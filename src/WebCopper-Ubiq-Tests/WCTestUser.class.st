Class {
	#name : #WCTestUser,
	#superclass : #WCAggregateRoot,
	#instVars : [
		'username'
	],
	#category : #'WebCopper-Ubiq-Tests-EventSourcing'
}

{ #category : #accessing }
WCTestUser class >> id: aTestUserId username: aString [
	^ super new recordThat:(WCTestUserWasCreatedEvent id: aTestUserId username: aString)
]

{ #category : #accessing }
WCTestUser class >> new [
	Error signal
]

{ #category : #applying }
WCTestUser >> applyUserWasCreated: anEvent [
	id := anEvent id.
	username := anEvent username
]

{ #category : #applying }
WCTestUser >> applyUsernameWasChanged: anEvent [
	username := anEvent username
]

{ #category : #updating }
WCTestUser >> updateUsername: aString [
	self recordThat: (WCTestUsernameWasChangedEvent id: id username: aString)
]

{ #category : #accessing }
WCTestUser >> username [
	^ username
]
