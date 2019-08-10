Class {
	#name : #WCTranscriptLoggerBackend,
	#superclass : #WCLoggerBackend,
	#category : #'WebCopper-Core-Logger'
}

{ #category : #formatting }
WCTranscriptLoggerBackend >> format: aLogEntry [

	|format|
	
	format := '[{datetime}] {level} : {message}'.

	^ format format: { 
		#datetime -> aLogEntry datetime asString.
		#level -> aLogEntry levelName.
		#message -> aLogEntry message
	} asDictionary 
]

{ #category : #'as yet unclassified' }
WCTranscriptLoggerBackend >> processEntry: aAKLogEntry [
	Transcript crShow: (self format: aAKLogEntry)
]
