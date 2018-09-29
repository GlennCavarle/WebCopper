Class {
	#name : #AKTestUser,
	#superclass : #AKAggregateRoot,
	#instVars : [
		'username'
	],
	#category : #'Alkalin-Ubiq-Tests-EventSourcing'
}

{ #category : #accessing }
AKTestUser class >> id: aTestUserId username: aString [
	^ super new recordThat:(AKTestUserWasCreatedEvent id: aTestUserId username: aString)
]

{ #category : #accessing }
AKTestUser class >> new [
	Error signal
]

{ #category : #applying }
AKTestUser >> applyUserWasCreated: anEvent [
	id := anEvent id.
	username := anEvent username
]

{ #category : #applying }
AKTestUser >> applyUsernameWasChanged: anEvent [
	username := anEvent username
]

{ #category : #updating }
AKTestUser >> updateUsername: aString [
	self recordThat: (AKTestUsernameWasChangedEvent id: id username: aString)
]

{ #category : #accessing }
AKTestUser >> username [
	^ username
]
