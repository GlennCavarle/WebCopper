Class {
	#name : #AKAuthResult,
	#superclass : #Object,
	#instVars : [
		'token',
		'response'
	],
	#category : #'Alkalin-Authentication-Authenticator'
}

{ #category : #'instance creation' }
AKAuthResult class >> failureWithResponse: anHttpResponse [
	^ self new
		response: anHttpResponse;
		yourself
]

{ #category : #'instance creation' }
AKAuthResult class >> successWithToken: aToken [
	^ self new
		token: aToken;
		yourself
]

{ #category : #accessing }
AKAuthResult >> response [
	^ response
]

{ #category : #accessing }
AKAuthResult >> response: anObject [
	response := anObject
]

{ #category : #accessing }
AKAuthResult >> token [
	^ token
]

{ #category : #accessing }
AKAuthResult >> token: anObject [
	token := anObject
]
