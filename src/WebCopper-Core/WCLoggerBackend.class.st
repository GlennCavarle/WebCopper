Class {
	#name : #WCLoggerBackend,
	#superclass : #Object,
	#instVars : [
		'minLevel'
	],
	#category : #'WebCopper-Core-Logger'
}

{ #category : #accessing }
WCLoggerBackend class >> minLevel: aNumber [
	^ self new
		minLevel: aNumber;
		yourself
]

{ #category : #comparing }
WCLoggerBackend >> = aAKLoggerBackend [
	^ self class = aAKLoggerBackend class
]

{ #category : #'as yet unclassified' }
WCLoggerBackend >> interestedIn: aLogEntry [
	^ aLogEntry level >= self minLevel
]

{ #category : #accessing }
WCLoggerBackend >> minLevel [
	^ minLevel
]

{ #category : #accessing }
WCLoggerBackend >> minLevel: anObject [
	minLevel := anObject
]

{ #category : #'as yet unclassified' }
WCLoggerBackend >> processEntry: aAKLogEntry [
	self subclassResponsibility 
]
