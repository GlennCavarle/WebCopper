Class {
	#name : #AKLogger,
	#superclass : #Object,
	#instVars : [
		'backends'
	],
	#classVars : [
		'uniqueInstance'
	],
	#category : #'Alkalin-Core-Logger'
}

{ #category : #'as yet unclassified' }
AKLogger class >> availableBackends [
	^ AKLoggerBackend allSubclasses
]

{ #category : #'error handling' }
AKLogger class >> error: aString [
	self uniqueInstance error: aString
]

{ #category : #'error handling' }
AKLogger class >> info: aString [
	self uniqueInstance info: aString
]

{ #category : #accessing }
AKLogger class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #accessing }
AKLogger class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := super new]
]

{ #category : #accessing }
AKLogger class >> withDefautBackend: aBackend [
	^ self uniqueInstance
		initializeWithBackend: aBackend;
		yourself
]

{ #category : #logging }
AKLogger >> error: aString [ 
	self error: aString context: nil
]

{ #category : #logging }
AKLogger >> error: aString context: anObject [
	self log: aString level: AKLogEntry errorLevel context: anObject
]

{ #category : #logging }
AKLogger >> info: aString [ 
	self log: aString level: AKLogEntry infoLevel
]

{ #category : #initialization }
AKLogger >> initialize [
	super initialize.
	backends := Set new
]

{ #category : #initialization }
AKLogger >> initializeWithBackend: aBackend [
	backends
		removeAll;
		add: aBackend
]

{ #category : #logging }
AKLogger >> log: aString level: aLogLevel [
	self log: aString level: aLogLevel context: nil
]

{ #category : #logging }
AKLogger >> log: aString level: aLogLevel context: anObject [
	self processEntry: (AKLogEntry level: aLogLevel message: aString context: anObject)
]

{ #category : #'as yet unclassified' }
AKLogger >> processEntry: aAKLogEntry [
	backends do: [ :b |  
		(b interestedIn: aAKLogEntry)
				ifTrue: [ b processEntry: aAKLogEntry ] 
		]
]
