Class {
	#name : #WCLogger,
	#superclass : #Object,
	#instVars : [
		'backends'
	],
	#classVars : [
		'uniqueInstance'
	],
	#category : #'WebCopper-Core-Logger'
}

{ #category : #'as yet unclassified' }
WCLogger class >> availableBackends [
	^ WCLoggerBackend allSubclasses
]

{ #category : #'error handling' }
WCLogger class >> error: aString [
	self uniqueInstance error: aString
]

{ #category : #'error handling' }
WCLogger class >> info: aString [
	self uniqueInstance info: aString
]

{ #category : #accessing }
WCLogger class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #accessing }
WCLogger class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new]
]

{ #category : #accessing }
WCLogger class >> withDefautBackend: aBackend [
	^ self uniqueInstance
		initializeWithBackend: aBackend;
		yourself
]

{ #category : #logging }
WCLogger >> error: aString [ 
	self error: aString context: nil
]

{ #category : #logging }
WCLogger >> error: aString context: anObject [
	self log: aString level: WCLogEntry errorLevel context: anObject
]

{ #category : #logging }
WCLogger >> info: aString [ 
	self log: aString level: WCLogEntry infoLevel
]

{ #category : #initialization }
WCLogger >> initialize [
	super initialize.
	backends := Set new
]

{ #category : #initialization }
WCLogger >> initializeWithBackend: aBackend [
	backends
		removeAll;
		add: aBackend
]

{ #category : #logging }
WCLogger >> log: aString level: aLogLevel [
	self log: aString level: aLogLevel context: nil
]

{ #category : #logging }
WCLogger >> log: aString level: aLogLevel context: anObject [
	self processEntry: (WCLogEntry level: aLogLevel message: aString context: anObject)
]

{ #category : #'as yet unclassified' }
WCLogger >> processEntry: aAKLogEntry [
	backends do: [ :b |  
		(b interestedIn: aAKLogEntry)
				ifTrue: [ b processEntry: aAKLogEntry ] 
		]
]
