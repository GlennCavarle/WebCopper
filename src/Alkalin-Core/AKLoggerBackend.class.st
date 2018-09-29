Class {
	#name : #AKLoggerBackend,
	#superclass : #Object,
	#instVars : [
		'minLevel'
	],
	#category : #'Alkalin-Core-Logger'
}

{ #category : #accessing }
AKLoggerBackend class >> minLevel: aNumber [
	^ self new
		minLevel: aNumber;
		yourself
]

{ #category : #comparing }
AKLoggerBackend >> = aAKLoggerBackend [
	^ self class = aAKLoggerBackend class
]

{ #category : #'as yet unclassified' }
AKLoggerBackend >> interestedIn: aLogEntry [
	^ aLogEntry level >= self minLevel
]

{ #category : #accessing }
AKLoggerBackend >> minLevel [
	^ minLevel
]

{ #category : #accessing }
AKLoggerBackend >> minLevel: anObject [
	minLevel := anObject
]

{ #category : #'as yet unclassified' }
AKLoggerBackend >> processEntry: aAKLogEntry [
	self subclassResponsibility 
]
