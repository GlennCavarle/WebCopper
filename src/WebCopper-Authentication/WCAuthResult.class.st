"
Response from an authenticator.
Contains an http response or/and a token
"
Class {
	#name : #WCAuthResult,
	#superclass : #Object,
	#instVars : [
		'token',
		'response'
	],
	#category : #'WebCopper-Authentication-Authenticator'
}

{ #category : #'instance creation' }
WCAuthResult class >> failureWithResponse: anHttpResponse [
	^ self new
		response: anHttpResponse;
		yourself
]

{ #category : #'instance creation' }
WCAuthResult class >> successWithToken: aToken [
	^ self new
		token: aToken;
		yourself
]

{ #category : #accessing }
WCAuthResult >> response [
	^ response
]

{ #category : #accessing }
WCAuthResult >> response: anObject [
	response := anObject
]

{ #category : #accessing }
WCAuthResult >> token [
	^ token
]

{ #category : #accessing }
WCAuthResult >> token: anObject [
	token := anObject
]
