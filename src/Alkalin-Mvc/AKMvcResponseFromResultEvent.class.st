Class {
	#name : #AKMvcResponseFromResultEvent,
	#superclass : #AKMvcEvent,
	#instVars : [
		'result',
		'response'
	],
	#category : #'Alkalin-Mvc-Event'
}

{ #category : #'as yet unclassified' }
AKMvcResponseFromResultEvent class >> request: aAKRequest result: anObject [
	^ self new
		request: aAKRequest;
		result: anObject;
		yourself
]

{ #category : #accessing }
AKMvcResponseFromResultEvent >> response [
	^ response
]

{ #category : #accessing }
AKMvcResponseFromResultEvent >> response: anObject [
	response := anObject
]

{ #category : #accessing }
AKMvcResponseFromResultEvent >> result [
	^ result
]

{ #category : #accessing }
AKMvcResponseFromResultEvent >> result: anObject [
	result := anObject
]
