Class {
	#name : #WCKernelEvent,
	#superclass : #WCEvent,
	#instVars : [
		'request'
	],
	#category : #'WebCopper-HttpKernel-Event'
}

{ #category : #accessing }
WCKernelEvent >> request [
	^ request
]

{ #category : #accessing }
WCKernelEvent >> request: anObject [
	request := anObject
]
