Class {
	#name : #AKRoute,
	#superclass : #Object,
	#instVars : [
		'name',
		'action',
		'requestMatcher'
	],
	#category : #'Alkalin-HttpRouter-Route'
}

{ #category : #initialization }
AKRoute class >> methods: anArray path: aString constraints: aDictionary action: anAction [
	^ self
		name: (self pathToName: aString)
		methods: anArray
		path: aString
		constraints: aDictionary
		action: anAction
]

{ #category : #initialization }
AKRoute class >> name: aSymbol methods: anArray path: aString constraints: aDictionary action: anAction [
	^ super new name: aSymbol methods: anArray path: aString constraints: aDictionary action: anAction
]

{ #category : #initialization }
AKRoute class >> pathToName: aPathString [
	<return: #Symbol>
	| aNameString |
	aNameString := aPathString.
	^ (aPathString collect: [ :each |  each isAlphaNumeric ifTrue: [ each ] ifFalse: [ $_ ] ]) asString asSymbol.
	
]

{ #category : #accessing }
AKRoute >> action [
	^ action
]

{ #category : #'accessing-parameters' }
AKRoute >> extractUrlParametersFrom: aAKHttpRequest [
	^ requestMatcher extractUrlValuesFrom: aAKHttpRequest
]

{ #category : #testing }
AKRoute >> matchRequest: aRequest [
	^ requestMatcher matchRequest: aRequest
]

{ #category : #accessing }
AKRoute >> methods [
	^ requestMatcher methods
]

{ #category : #accessing }
AKRoute >> name [
	^ name
]

{ #category : #initialization }
AKRoute >> name: aSymbol methods: anArray path: aString constraints: aDictionary action: anAction [
	name := aSymbol.
	requestMatcher := AKRequestMatcher methods: anArray path: aString constraints: aDictionary.
	action := anAction.
]

{ #category : #accessing }
AKRoute >> path [
	^ requestMatcher path
]

{ #category : #printing }
AKRoute >> printOn: aStream [
	aStream
		nextPut: $[;
		nextPutAll: (self methods joinUsing: '|');
		nextPutAll: '] : ';
		nextPutAll: self path;
		nextPutAll: ' -> ';
		nextPutAll: self action asString
]
