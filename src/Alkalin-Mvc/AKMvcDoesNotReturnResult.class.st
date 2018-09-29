Class {
	#name : #AKMvcDoesNotReturnResult,
	#superclass : #AKMvcException,
	#instVars : [
		'action'
	],
	#category : #'Alkalin-Mvc-Exception'
}

{ #category : #signalling }
AKMvcDoesNotReturnResult class >> signalForRequest: aAKHttpRequest action: aAKAction [
	self new
		request: aAKHttpRequest;
		action: aAKAction;
		signal: 'A AKAction must return a result'
]

{ #category : #accessing }
AKMvcDoesNotReturnResult >> action [
	^ action
]

{ #category : #accessing }
AKMvcDoesNotReturnResult >> action: anObject [
	action := anObject
]
