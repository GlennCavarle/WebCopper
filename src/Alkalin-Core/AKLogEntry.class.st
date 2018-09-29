Class {
	#name : #AKLogEntry,
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
	#category : #'Alkalin-Core-Logger'
}

{ #category : #levels }
AKLogEntry class >> criticalLevel [
	^ self levels at:#critical
]

{ #category : #levels }
AKLogEntry class >> debugLevel [
	^ self levels at:#debug
]

{ #category : #levels }
AKLogEntry class >> errorLevel [
	^ self levels at:#error
]

{ #category : #levels }
AKLogEntry class >> infoLevel [
^ self levels at:#info
]

{ #category : #initialization }
AKLogEntry class >> initialize [
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
AKLogEntry class >> level: aLevel message: aString [ 
	^ self level: aLevel message: aString  context: nil
]

{ #category : #'instance creation' }
AKLogEntry class >> level: aLevel message: aString context: anObject [
	^ self new
		level: aLevel;
		message: aString;
		context: anObject;
		yourself
]

{ #category : #levels }
AKLogEntry class >> levelNameFrom: aNumber [
	^ levels keyAtValue: aNumber
]

{ #category : #levels }
AKLogEntry class >> levels [
	^ levels
]

{ #category : #levels }
AKLogEntry class >> noticeLevel [
	^ self levels at:#notice
]

{ #category : #levels }
AKLogEntry class >> warningLevel [
	^ self levels at:#warning
]

{ #category : #accessing }
AKLogEntry >> context [
	^ context
]

{ #category : #accessing }
AKLogEntry >> context: anObject [
	context := anObject
]

{ #category : #accessing }
AKLogEntry >> datetime [
	^ datetime
]

{ #category : #accessing }
AKLogEntry >> datetime: anObject [
	datetime := anObject
]

{ #category : #initialization }
AKLogEntry >> initialize [
	super initialize.
	datetime := DateAndTime now
]

{ #category : #accessing }
AKLogEntry >> level [
	^ level
]

{ #category : #accessing }
AKLogEntry >> level: anObject [
	level := anObject
]

{ #category : #'as yet unclassified' }
AKLogEntry >> levelName [
	^ self class levelNameFrom: level
]

{ #category : #accessing }
AKLogEntry >> message [
	^ message
]

{ #category : #accessing }
AKLogEntry >> message: anObject [
	message := anObject
]
