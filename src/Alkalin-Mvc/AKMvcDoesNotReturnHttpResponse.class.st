Class {
	#name : #AKMvcDoesNotReturnHttpResponse,
	#superclass : #AKMvcException,
	#instVars : [
		'action',
		'result'
	],
	#category : #'Alkalin-Mvc-Exception'
}

{ #category : #signalling }
AKMvcDoesNotReturnHttpResponse class >> signalForRequest: aAKRequest action: aAKAction result: anObject [
	self new 
		request: aAKRequest;
		action: aAKAction;
		result: anObject;
		signal: 'An HttpResponse must be returned'
]

{ #category : #accessing }
AKMvcDoesNotReturnHttpResponse >> action [
	^ action
]

{ #category : #accessing }
AKMvcDoesNotReturnHttpResponse >> action: anObject [
	action := anObject
]

{ #category : #accessing }
AKMvcDoesNotReturnHttpResponse >> result [
	^ result
]

{ #category : #accessing }
AKMvcDoesNotReturnHttpResponse >> result: anObject [
	result := anObject
]
