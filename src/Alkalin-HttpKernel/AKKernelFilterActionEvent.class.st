Class {
	#name : #AKKernelFilterActionEvent,
	#superclass : #AKKernelEvent,
	#instVars : [
		'action'
	],
	#category : #'Alkalin-HttpKernel-Event'
}

{ #category : #'as yet unclassified' }
AKKernelFilterActionEvent class >> request: aAKRequest action: aAKAction [
	^ self new
		request: aAKRequest;
		action: aAKAction;
		yourself
]

{ #category : #accessing }
AKKernelFilterActionEvent >> action [
	^ action
]

{ #category : #accessing }
AKKernelFilterActionEvent >> action: anObject [
	action := anObject
]
