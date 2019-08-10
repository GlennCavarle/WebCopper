Class {
	#name : #WCKernelDoesNotReturnResult,
	#superclass : #WCKernelException,
	#instVars : [
		'action'
	],
	#category : #'WebCopper-HttpKernel-Exception'
}

{ #category : #signalling }
WCKernelDoesNotReturnResult class >> signalForRequest: aAKHttpRequest action: aAKAction [
	self new
		request: aAKHttpRequest;
		action: aAKAction;
		signal: 'A AKAction must return a result'
]

{ #category : #accessing }
WCKernelDoesNotReturnResult >> action [
	^ action
]

{ #category : #accessing }
WCKernelDoesNotReturnResult >> action: anObject [
	action := anObject
]
