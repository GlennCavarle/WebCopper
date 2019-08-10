Class {
	#name : #WCRoute,
	#superclass : #Object,
	#instVars : [
		'name',
		'action',
		'requestMatcher'
	],
	#category : #'WebCopper-HttpRouter-Route'
}

{ #category : #initialization }
WCRoute class >> methods: anArray path: aString constraints: aDictionary action: anAction [
	^ self
		name: (self pathToName: aString)
		methods: anArray
		path: aString
		constraints: aDictionary
		action: anAction
]

{ #category : #initialization }
WCRoute class >> name: aSymbol methods: anArray path: aString constraints: aDictionary action: anAction [
	^ super new name: aSymbol methods: anArray path: aString constraints: aDictionary action: anAction
]

{ #category : #initialization }
WCRoute class >> pathToName: aPathString [
	<return: #Symbol>
	| aNameString |
	aNameString := aPathString.
	^ (aPathString collect: [ :each |  each isAlphaNumeric ifTrue: [ each ] ifFalse: [ $_ ] ]) asString asSymbol.
	
]

{ #category : #accessing }
WCRoute >> action [
	^ action
]

{ #category : #'accessing-parameters' }
WCRoute >> extractUrlParametersFrom: aAKHttpRequest [
	^ requestMatcher extractUrlValuesFrom: aAKHttpRequest
]

{ #category : #testing }
WCRoute >> matchRequest: aRequest [
	^ requestMatcher matchRequest: aRequest
]

{ #category : #accessing }
WCRoute >> methods [
	^ requestMatcher methods
]

{ #category : #accessing }
WCRoute >> name [
	^ name
]

{ #category : #initialization }
WCRoute >> name: aSymbol methods: anArray path: aString constraints: aDictionary action: anAction [
	name := aSymbol.
	requestMatcher := WCRequestMatcher methods: anArray path: aString constraints: aDictionary.
	action := anAction.
]

{ #category : #accessing }
WCRoute >> path [
	^ requestMatcher path
]

{ #category : #printing }
WCRoute >> printOn: aStream [
	aStream
		nextPut: $[;
		nextPutAll: (self methods joinUsing: '|');
		nextPutAll: '] : ';
		nextPutAll: self path;
		nextPutAll: ' -> ';
		nextPutAll: self action asString
]
