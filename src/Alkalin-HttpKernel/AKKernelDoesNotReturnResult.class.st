Class {
	#name : #AKKernelDoesNotReturnResult,
	#superclass : #AKKernelException,
	#instVars : [
		'action'
	],
	#category : #'Alkalin-HttpKernel-Exception'
}

{ #category : #signalling }
AKKernelDoesNotReturnResult class >> signalForRequest: aAKHttpRequest action: aAKAction [
	self new
		request: aAKHttpRequest;
		action: aAKAction;
		signal: 'A AKAction must return a result'
]

{ #category : #accessing }
AKKernelDoesNotReturnResult >> action [
	^ action
]

{ #category : #accessing }
AKKernelDoesNotReturnResult >> action: anObject [
	action := anObject
]
