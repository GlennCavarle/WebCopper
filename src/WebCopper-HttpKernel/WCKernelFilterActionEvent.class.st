Class {
	#name : #WCKernelFilterActionEvent,
	#superclass : #WCKernelEvent,
	#instVars : [
		'action'
	],
	#category : #'WebCopper-HttpKernel-Event'
}

{ #category : #'as yet unclassified' }
WCKernelFilterActionEvent class >> request: aAKRequest action: aAKAction [
	^ self new
		request: aAKRequest;
		action: aAKAction;
		yourself
]

{ #category : #accessing }
WCKernelFilterActionEvent >> action [
	^ action
]

{ #category : #accessing }
WCKernelFilterActionEvent >> action: anObject [
	action := anObject
]
