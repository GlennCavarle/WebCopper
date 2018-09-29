Class {
	#name : #AKDiObjectReference,
	#superclass : #AKDiReference,
	#instVars : [
		'object'
	],
	#category : #'Alkalin-Di-Reference'
}

{ #category : #accessing }
AKDiObjectReference class >> object: anObject [
	^ self new
		object: anObject;
		yourself
]

{ #category : #accessing }
AKDiObjectReference >> object [
	^ object
]

{ #category : #accessing }
AKDiObjectReference >> object: anObject [
	object := anObject
]

{ #category : #'as yet unclassified' }
AKDiObjectReference >> resolveUsing: aServiceContainer [
	^ self object
]
