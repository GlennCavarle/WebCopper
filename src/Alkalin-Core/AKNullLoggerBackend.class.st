Class {
	#name : #AKNullLoggerBackend,
	#superclass : #AKLoggerBackend,
	#category : #'Alkalin-Core-Logger'
}

{ #category : #'as yet unclassified' }
AKNullLoggerBackend >> interestedIn: aLogEntry [
	^ false
]

{ #category : #'as yet unclassified' }
AKNullLoggerBackend >> processEntry: aAKLogEntry [
	"does nothing"
]
