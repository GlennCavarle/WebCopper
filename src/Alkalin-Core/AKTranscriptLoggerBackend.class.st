Class {
	#name : #AKTranscriptLoggerBackend,
	#superclass : #AKLoggerBackend,
	#category : #'Alkalin-Core-Logger'
}

{ #category : #formatting }
AKTranscriptLoggerBackend >> format: aLogEntry [

	|format|
	
	format := '[{datetime}] {level} : {message}'.

	^ format format: { 
		#datetime -> aLogEntry datetime asString.
		#level -> aLogEntry levelName.
		#message -> aLogEntry message
	} asDictionary 
]

{ #category : #'as yet unclassified' }
AKTranscriptLoggerBackend >> processEntry: aAKLogEntry [
	Transcript crShow: (self format: aAKLogEntry)
]
