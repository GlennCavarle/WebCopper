Class {
	#name : #AKAuthToken,
	#superclass : #Object,
	#instVars : [
		'user',
		'isAuthenticated'
	],
	#category : #'Alkalin-Authentication-Token'
}

{ #category : #accessing }
AKAuthToken >> beAuthenticated [
	isAuthenticated := true
]

{ #category : #'as yet unclassified' }
AKAuthToken >> clearCredentials [
]

{ #category : #initialization }
AKAuthToken >> initialize [
	super initialize.
	isAuthenticated := false.
]

{ #category : #accessing }
AKAuthToken >> isAuthenticated [
	^ isAuthenticated
]

{ #category : #accessing }
AKAuthToken >> user [
	^ user
]

{ #category : #accessing }
AKAuthToken >> user: anObject [
	user := anObject
]
