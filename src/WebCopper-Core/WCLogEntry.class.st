Class {
	#name : #WCLogEntry,
	#superclass : #Object,
	#instVars : [
		'datetime',
		'message',
		'level',
		'context'
	],
	#classVars : [
		'levels'
	],
	#category : #'WebCopper-Core-Logger'
}

{ #category : #levels }
WCLogEntry class >> criticalLevel [
	^ self levels at:#critical
]

{ #category : #levels }
WCLogEntry class >> debugLevel [
	^ self levels at:#debug
]

{ #category : #levels }
WCLogEntry class >> errorLevel [
	^ self levels at:#error
]

{ #category : #levels }
WCLogEntry class >> infoLevel [
^ self levels at:#info
]

{ #category : #initialization }
WCLogEntry class >> initialize [
	super initialize.
	levels := {
	(#debug -> 100).
	(#info -> 200).
	(#notice -> 300).
	(#warning -> 400).
	(#error -> 500).
	(#critical -> 600)} asDictionary
]

{ #category : #'instance creation' }
WCLogEntry class >> level: aLevel message: aString [ 
	^ self level: aLevel message: aString  context: nil
]

{ #category : #'instance creation' }
WCLogEntry class >> level: aLevel message: aString context: anObject [
	^ self new
		level: aLevel;
		message: aString;
		context: anObject;
		yourself
]

{ #category : #levels }
WCLogEntry class >> levelNameFrom: aNumber [
	^ levels keyAtValue: aNumber
]

{ #category : #levels }
WCLogEntry class >> levels [
	^ levels
]

{ #category : #levels }
WCLogEntry class >> noticeLevel [
	^ self levels at:#notice
]

{ #category : #levels }
WCLogEntry class >> warningLevel [
	^ self levels at:#warning
]

{ #category : #accessing }
WCLogEntry >> context [
	^ context
]

{ #category : #accessing }
WCLogEntry >> context: anObject [
	context := anObject
]

{ #category : #accessing }
WCLogEntry >> datetime [
	^ datetime
]

{ #category : #accessing }
WCLogEntry >> datetime: anObject [
	datetime := anObject
]

{ #category : #initialization }
WCLogEntry >> initialize [
	super initialize.
	datetime := DateAndTime now
]

{ #category : #accessing }
WCLogEntry >> level [
	^ level
]

{ #category : #accessing }
WCLogEntry >> level: anObject [
	level := anObject
]

{ #category : #'as yet unclassified' }
WCLogEntry >> levelName [
	^ self class levelNameFrom: level
]

{ #category : #accessing }
WCLogEntry >> message [
	^ message
]

{ #category : #accessing }
WCLogEntry >> message: anObject [
	message := anObject
]
