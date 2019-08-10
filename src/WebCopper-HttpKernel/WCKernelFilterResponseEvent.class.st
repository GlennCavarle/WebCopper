Class {
	#name : #WCKernelFilterResponseEvent,
	#superclass : #WCKernelEvent,
	#instVars : [
		'response'
	],
	#category : #'WebCopper-HttpKernel-Event'
}

{ #category : #'as yet unclassified' }
WCKernelFilterResponseEvent class >> request: aAKHttpRequest response: aAKHttpResponse [
	^ self new
		request: aAKHttpRequest;
		response: aAKHttpResponse;
		yourself
]

{ #category : #accessing }
WCKernelFilterResponseEvent >> response [
	^ response
]

{ #category : #accessing }
WCKernelFilterResponseEvent >> response: anObject [
	response := anObject
]
