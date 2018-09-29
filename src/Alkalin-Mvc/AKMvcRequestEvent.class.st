Class {
	#name : #AKMvcRequestEvent,
	#superclass : #AKMvcEvent,
	#instVars : [
		'action',
		'response'
	],
	#category : #'Alkalin-Mvc-Event'
}

{ #category : #accessing }
AKMvcRequestEvent class >> request: aAKRequest [
	^ self new
		request: aAKRequest;
		yourself
]

{ #category : #accessing }
AKMvcRequestEvent >> action [
	^ action
]

{ #category : #accessing }
AKMvcRequestEvent >> action: anObject [
	action := anObject
]

{ #category : #accessing }
AKMvcRequestEvent >> response [
	^ response
]

{ #category : #accessing }
AKMvcRequestEvent >> response: anObject [
	response := anObject
]
