Class {
	#name : #AKKernelResponseFromResultEvent,
	#superclass : #AKKernelEvent,
	#instVars : [
		'result',
		'response'
	],
	#category : #'Alkalin-HttpKernel-Event'
}

{ #category : #'as yet unclassified' }
AKKernelResponseFromResultEvent class >> request: aAKRequest result: anObject [
	^ self new
		request: aAKRequest;
		result: anObject;
		yourself
]

{ #category : #accessing }
AKKernelResponseFromResultEvent >> response [
	^ response
]

{ #category : #accessing }
AKKernelResponseFromResultEvent >> response: anObject [
	response := anObject
]

{ #category : #accessing }
AKKernelResponseFromResultEvent >> result [
	^ result
]

{ #category : #accessing }
AKKernelResponseFromResultEvent >> result: anObject [
	result := anObject
]
