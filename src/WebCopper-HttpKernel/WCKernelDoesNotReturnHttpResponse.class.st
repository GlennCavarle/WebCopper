Class {
	#name : #WCKernelDoesNotReturnHttpResponse,
	#superclass : #WCKernelException,
	#instVars : [
		'action',
		'result'
	],
	#category : #'WebCopper-HttpKernel-Exception'
}

{ #category : #signalling }
WCKernelDoesNotReturnHttpResponse class >> signalForRequest: aAKRequest action: aAKAction result: anObject [
	self new 
		request: aAKRequest;
		action: aAKAction;
		result: anObject;
		signal: 'An HttpResponse must be returned'
]

{ #category : #accessing }
WCKernelDoesNotReturnHttpResponse >> action [
	^ action
]

{ #category : #accessing }
WCKernelDoesNotReturnHttpResponse >> action: anObject [
	action := anObject
]

{ #category : #accessing }
WCKernelDoesNotReturnHttpResponse >> result [
	^ result
]

{ #category : #accessing }
WCKernelDoesNotReturnHttpResponse >> result: anObject [
	result := anObject
]
