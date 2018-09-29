Class {
	#name : #AKMvcFilterActionEvent,
	#superclass : #AKMvcEvent,
	#instVars : [
		'action'
	],
	#category : #'Alkalin-Mvc-Event'
}

{ #category : #'as yet unclassified' }
AKMvcFilterActionEvent class >> request: aAKRequest action: aAKAction [
	^ self new
		request: aAKRequest;
		action: aAKAction;
		yourself
]

{ #category : #accessing }
AKMvcFilterActionEvent >> action [
	^ action
]

{ #category : #accessing }
AKMvcFilterActionEvent >> action: anObject [
	action := anObject
]
