Class {
	#name : #AKKernelEvent,
	#superclass : #AKEvent,
	#instVars : [
		'request'
	],
	#category : #'Alkalin-HttpKernel-Event'
}

{ #category : #accessing }
AKKernelEvent >> request [
	^ request
]

{ #category : #accessing }
AKKernelEvent >> request: anObject [
	request := anObject
]
