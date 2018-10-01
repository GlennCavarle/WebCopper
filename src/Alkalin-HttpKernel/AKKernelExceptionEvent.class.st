Class {
	#name : #AKKernelExceptionEvent,
	#superclass : #AKKernelEvent,
	#instVars : [
		'response',
		'exception'
	],
	#category : #'Alkalin-HttpKernel-Event'
}

{ #category : #'as yet unclassified' }
AKKernelExceptionEvent class >> request: aAKHttpRequest exception: anException [
	^ self new
		request: aAKHttpRequest;
		exception: anException
		yourself
]

{ #category : #accessing }
AKKernelExceptionEvent >> exception [
	^ exception
]

{ #category : #accessing }
AKKernelExceptionEvent >> exception: anObject [
	exception := anObject
]

{ #category : #accessing }
AKKernelExceptionEvent >> response [
	^ response
]

{ #category : #accessing }
AKKernelExceptionEvent >> response: anObject [
	response := anObject.
	self stopPropagation 
]
