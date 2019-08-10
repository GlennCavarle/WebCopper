Class {
	#name : #WCKernelExceptionEvent,
	#superclass : #WCKernelEvent,
	#instVars : [
		'response',
		'exception'
	],
	#category : #'WebCopper-HttpKernel-Event'
}

{ #category : #'as yet unclassified' }
WCKernelExceptionEvent class >> request: aAKHttpRequest exception: anException [
	^ self new
		request: aAKHttpRequest;
		exception: anException
		yourself
]

{ #category : #accessing }
WCKernelExceptionEvent >> exception [
	^ exception
]

{ #category : #accessing }
WCKernelExceptionEvent >> exception: anObject [
	exception := anObject
]

{ #category : #accessing }
WCKernelExceptionEvent >> response [
	^ response
]

{ #category : #accessing }
WCKernelExceptionEvent >> response: anObject [
	response := anObject.
	self stopPropagation 
]
