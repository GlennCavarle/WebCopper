Class {
	#name : #WCNullLoggerBackend,
	#superclass : #WCLoggerBackend,
	#category : #'WebCopper-Core-Logger'
}

{ #category : #'as yet unclassified' }
WCNullLoggerBackend >> interestedIn: aLogEntry [
	^ false
]

{ #category : #'as yet unclassified' }
WCNullLoggerBackend >> processEntry: aAKLogEntry [
	"does nothing"
]
