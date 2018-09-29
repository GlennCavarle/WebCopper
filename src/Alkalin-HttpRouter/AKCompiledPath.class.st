Class {
	#name : #AKCompiledPath,
	#superclass : #Object,
	#instVars : [
		'path',
		'pathRegex',
		'placeholders',
		'constraints'
	],
	#category : #'Alkalin-HttpRouter-Route'
}

{ #category : #'instance creation' }
AKCompiledPath class >> fromString: aString [
	^ self fromString: aString constraints: Dictionary new
]

{ #category : #'instance creation' }
AKCompiledPath class >> fromString: aString constraints: aDictionary [
	^ super new
		initializeFromString: aString constraints: aDictionary
		yourself
]

{ #category : #'instance creation' }
AKCompiledPath class >> new [
	self error: 'Use #fromString: or #fromString:constraints:'
]

{ #category : #private }
AKCompiledPath >> atPlaceholder: aKey valueFrom: aPathString [
	^ (placeholders at: aKey) findValueIn: aPathString
]

{ #category : #private }
AKCompiledPath >> buildPlaceholders [
	| phRegex|
	placeholders := Dictionary new.
	phRegex := '\:(\w+)(\(([^/]+)\))?' asRegex.
	phRegex  matchesIn: path  subexpressionsDo: [ :s :ss | 
			(ss at: 3) ifNotNil:[
			 	constraints at: ss first put: (AKPlaceholderConstraint fromString: (ss at:3))
			].
			placeholders at: ss first put:
					(AKPlaceholder
						name: ss first
						pattern: s
						position: (self segmentPositionOf: ss first)
						constraint: (self constraintsAt: ss first)) ]
]

{ #category : #private }
AKCompiledPath >> buildRegex [
	| regexStr |
	regexStr := path.
	placeholders do: [ :each | regexStr := each copyReplaceByRegexIn: regexStr ].
	pathRegex := regexStr asRegex
]

{ #category : #accessing }
AKCompiledPath >> constraints [
	^ constraints
]

{ #category : #private }
AKCompiledPath >> constraintsAt: aKey [
	^ constraints at: aKey ifAbsentPut: [ AKPlaceholderConstraint any ]
]

{ #category : #initialization }
AKCompiledPath >> initializeFromString: aString constraints: aDictionary [
	path := aString.
	constraints := aDictionary.
	self
		buildPlaceholders;
		buildRegex
]

{ #category : #testing }
AKCompiledPath >> match: aPathString [
	^  pathRegex matches: aPathString
]

{ #category : #accessing }
AKCompiledPath >> path [
	^ path
]

{ #category : #private }
AKCompiledPath >> placeholderValuesFrom: aPathString [
	<return: #Dictionary>
	
	^ (placeholders collect: [ :each | each findValueIn: aPathString ])
]

{ #category : #accessing }
AKCompiledPath >> placeholders [
	^ placeholders
]

{ #category : #private }
AKCompiledPath >> segmentPositionOf: aString [
	| strPosition stream position |
	strPosition := path findString: aString.
	stream := (path copyFrom:1  to: strPosition) readStream.
	position := 0.
	[ stream atEnd ] whileFalse: [
			stream next = $/ ifTrue: [ position := position + 1 ] ].
	^ position
]
