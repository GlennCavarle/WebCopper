Class {
	#name : #WCKernelResponseFromResultEvent,
	#superclass : #WCKernelEvent,
	#instVars : [
		'result',
		'response'
	],
	#category : #'WebCopper-HttpKernel-Event'
}

{ #category : #'as yet unclassified' }
WCKernelResponseFromResultEvent class >> request: aAKRequest result: anObject [
	^ self new
		request: aAKRequest;
		result: anObject;
		yourself
]

{ #category : #accessing }
WCKernelResponseFromResultEvent >> response [
	^ response
]

{ #category : #accessing }
WCKernelResponseFromResultEvent >> response: anObject [
	response := anObject
]

{ #category : #accessing }
WCKernelResponseFromResultEvent >> result [
	^ result
]

{ #category : #accessing }
WCKernelResponseFromResultEvent >> result: anObject [
	result := anObject
]
