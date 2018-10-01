Class {
	#name : #AKKernelException,
	#superclass : #AKException,
	#instVars : [
		'request'
	],
	#category : #'Alkalin-HttpKernel-Exception'
}

{ #category : #accessing }
AKKernelException >> request [
	^ request
]

{ #category : #accessing }
AKKernelException >> request: anObject [
	request := anObject
]
