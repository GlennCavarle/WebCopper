Class {
	#name : #AKMvcFilterResponseEvent,
	#superclass : #AKMvcEvent,
	#instVars : [
		'response'
	],
	#category : #'Alkalin-Mvc-Event'
}

{ #category : #'as yet unclassified' }
AKMvcFilterResponseEvent class >> request: aAKHttpRequest response: aAKHttpResponse [
	^ self new
		request: aAKHttpRequest;
		response: aAKHttpResponse;
		yourself
]

{ #category : #accessing }
AKMvcFilterResponseEvent >> response [
	^ response
]

{ #category : #accessing }
AKMvcFilterResponseEvent >> response: anObject [
	response := anObject
]
