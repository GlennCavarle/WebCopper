Class {
	#name : #WCDiObjectReference,
	#superclass : #WCDiReference,
	#instVars : [
		'object'
	],
	#category : #'WebCopper-Di-Reference'
}

{ #category : #accessing }
WCDiObjectReference class >> object: anObject [
	^ self new
		object: anObject;
		yourself
]

{ #category : #accessing }
WCDiObjectReference >> object [
	^ object
]

{ #category : #accessing }
WCDiObjectReference >> object: anObject [
	object := anObject
]

{ #category : #'as yet unclassified' }
WCDiObjectReference >> resolveUsing: aServiceContainer [
	^ self object
]
