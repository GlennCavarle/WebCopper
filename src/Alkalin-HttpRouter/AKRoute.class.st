Class {
	#name : #AKRoute,
	#superclass : #Object,
	#instVars : [
		'name',
		'methods',
		'compiledPath',
		'action'
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

{ #category : #private }
AKRoute >> matchMethod: aMethodSymbol [
	^ methods anySatisfy: [:each| each = aMethodSymbol]
]

{ #category : #private }
AKRoute >> matchPath: aPathString [
	^ compiledPath match: aPathString
]

{ #category : #testing }
AKRoute >> matchRequest: aRequest [
	^ ( self matchMethod: aRequest method ) and: [ self matchPath: aRequest unprefixedPath ]
]

{ #category : #accessing }
AKRoute >> methods [
	^ methods
]

{ #category : #accessing }
AKRoute >> name [
	^ name
]

{ #category : #initialization }
AKRoute >> name: aSymbol methods: anArray path: aString constraints: aDictionary action: anAction [
	name := aSymbol.
	methods := anArray.
	compiledPath := AKCompiledPath fromString:aString constraints: aDictionary.
	action := anAction.
]

{ #category : #accessing }
AKRoute >> path [
	^ compiledPath path
]

{ #category : #'accessing-parameters' }
AKRoute >> pathParametersFrom: aAKHttpRequest [
	^ compiledPath placeholderValuesFrom: aAKHttpRequest unprefixedPath.
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
