Class {
	#name : #WCDiServiceReference,
	#superclass : #WCDiReference,
	#instVars : [
		'identifier'
	],
	#category : #'WebCopper-Di-Reference'
}

{ #category : #'initialize-release' }
WCDiServiceReference class >> identifier: aSymbol [
	^ self new
		identifier: aSymbol;
		yourself
]

{ #category : #accessing }
WCDiServiceReference >> identifier [
	^ identifier
]

{ #category : #accessing }
WCDiServiceReference >> identifier: anObject [
	identifier := anObject
]

{ #category : #'as yet unclassified' }
WCDiServiceReference >> resolveUsing: aServiceContainer [
	^ aServiceContainer get: self identifier
]
