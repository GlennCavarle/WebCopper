Class {
	#name : #WCKernelException,
	#superclass : #WCException,
	#instVars : [
		'request'
	],
	#category : #'WebCopper-HttpKernel-Exception'
}

{ #category : #accessing }
WCKernelException >> request [
	^ request
]

{ #category : #accessing }
WCKernelException >> request: anObject [
	request := anObject
]
