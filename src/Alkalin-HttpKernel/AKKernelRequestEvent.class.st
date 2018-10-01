Class {
	#name : #AKKernelRequestEvent,
	#superclass : #AKKernelEvent,
	#instVars : [
		'action',
		'response'
	],
	#category : #'Alkalin-HttpKernel-Event'
}

{ #category : #accessing }
AKKernelRequestEvent class >> request: aAKRequest [
	^ self new
		request: aAKRequest;
		yourself
]

{ #category : #accessing }
AKKernelRequestEvent >> action [
	^ action
]

{ #category : #accessing }
AKKernelRequestEvent >> action: anObject [
	action := anObject
]

{ #category : #accessing }
AKKernelRequestEvent >> response [
	^ response
]

{ #category : #accessing }
AKKernelRequestEvent >> response: anObject [
	response := anObject.
	self stopPropagation
]
