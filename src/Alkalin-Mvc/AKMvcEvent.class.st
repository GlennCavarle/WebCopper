Class {
	#name : #AKMvcEvent,
	#superclass : #AKEvent,
	#instVars : [
		'request'
	],
	#category : #'Alkalin-Mvc-Event'
}

{ #category : #accessing }
AKMvcEvent >> request [
	^ request
]

{ #category : #accessing }
AKMvcEvent >> request: anObject [
	request := anObject
]
