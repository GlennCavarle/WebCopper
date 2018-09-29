Class {
	#name : #AKDiServiceReference,
	#superclass : #AKDiReference,
	#instVars : [
		'identifier'
	],
	#category : #'Alkalin-Di-Reference'
}

{ #category : #'initialize-release' }
AKDiServiceReference class >> identifier: aSymbol [
	^ self new
		identifier: aSymbol;
		yourself
]

{ #category : #accessing }
AKDiServiceReference >> identifier [
	^ identifier
]

{ #category : #accessing }
AKDiServiceReference >> identifier: anObject [
	identifier := anObject
]

{ #category : #'as yet unclassified' }
AKDiServiceReference >> resolveUsing: aServiceContainer [
	^ aServiceContainer get: self identifier
]
