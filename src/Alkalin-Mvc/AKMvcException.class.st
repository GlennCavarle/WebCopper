Class {
	#name : #AKMvcException,
	#superclass : #AKException,
	#instVars : [
		'request'
	],
	#category : #'Alkalin-Mvc-Exception'
}

{ #category : #accessing }
AKMvcException >> request [
	^ request
]

{ #category : #accessing }
AKMvcException >> request: anObject [
	request := anObject
]
