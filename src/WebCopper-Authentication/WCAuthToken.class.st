Class {
	#name : #WCAuthToken,
	#superclass : #Object,
	#instVars : [
		'user',
		'isAuthenticated'
	],
	#category : #'WebCopper-Authentication-Token'
}

{ #category : #accessing }
WCAuthToken >> beAuthenticated [
	isAuthenticated := true
]

{ #category : #'as yet unclassified' }
WCAuthToken >> clearCredentials [
]

{ #category : #initialization }
WCAuthToken >> initialize [
	super initialize.
	isAuthenticated := false.
]

{ #category : #accessing }
WCAuthToken >> isAuthenticated [
	^ isAuthenticated
]

{ #category : #accessing }
WCAuthToken >> user [
	^ user
]

{ #category : #accessing }
WCAuthToken >> user: anObject [
	user := anObject
]
