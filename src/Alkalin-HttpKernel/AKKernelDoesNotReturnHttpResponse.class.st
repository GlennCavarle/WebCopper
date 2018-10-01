Class {
	#name : #AKKernelDoesNotReturnHttpResponse,
	#superclass : #AKKernelException,
	#instVars : [
		'action',
		'result'
	],
	#category : #'Alkalin-HttpKernel-Exception'
}

{ #category : #signalling }
AKKernelDoesNotReturnHttpResponse class >> signalForRequest: aAKRequest action: aAKAction result: anObject [
	self new 
		request: aAKRequest;
		action: aAKAction;
		result: anObject;
		signal: 'An HttpResponse must be returned'
]

{ #category : #accessing }
AKKernelDoesNotReturnHttpResponse >> action [
	^ action
]

{ #category : #accessing }
AKKernelDoesNotReturnHttpResponse >> action: anObject [
	action := anObject
]

{ #category : #accessing }
AKKernelDoesNotReturnHttpResponse >> result [
	^ result
]

{ #category : #accessing }
AKKernelDoesNotReturnHttpResponse >> result: anObject [
	result := anObject
]
