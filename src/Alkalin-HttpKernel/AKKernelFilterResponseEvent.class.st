Class {
	#name : #AKKernelFilterResponseEvent,
	#superclass : #AKKernelEvent,
	#instVars : [
		'response'
	],
	#category : #'Alkalin-HttpKernel-Event'
}

{ #category : #'as yet unclassified' }
AKKernelFilterResponseEvent class >> request: aAKHttpRequest response: aAKHttpResponse [
	^ self new
		request: aAKHttpRequest;
		response: aAKHttpResponse;
		yourself
]

{ #category : #accessing }
AKKernelFilterResponseEvent >> response [
	^ response
]

{ #category : #accessing }
AKKernelFilterResponseEvent >> response: anObject [
	response := anObject
]
