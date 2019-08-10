Class {
	#name : #WCKernelRequestEvent,
	#superclass : #WCKernelEvent,
	#instVars : [
		'action',
		'response'
	],
	#category : #'WebCopper-HttpKernel-Event'
}

{ #category : #accessing }
WCKernelRequestEvent class >> request: aAKRequest [
	^ self new
		request: aAKRequest;
		yourself
]

{ #category : #accessing }
WCKernelRequestEvent >> action [
	^ action
]

{ #category : #accessing }
WCKernelRequestEvent >> action: anObject [
	action := anObject
]

{ #category : #accessing }
WCKernelRequestEvent >> response [
	^ response
]

{ #category : #accessing }
WCKernelRequestEvent >> response: anObject [
	response := anObject.
	self stopPropagation
]
