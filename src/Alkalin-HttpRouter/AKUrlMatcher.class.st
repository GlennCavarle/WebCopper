Class {
	#name : #AKUrlMatcher,
	#superclass : #AKAbstractRequestMatcher,
	#instVars : [
		'placeholders',
		'path',
		'constraints',
		'pathRegex'
	],
	#category : #'Alkalin-HttpRouter-Matcher'
}

{ #category : #'instance creation' }
AKUrlMatcher class >> fromString: aString [
	^ self fromString: aString constraints: Dictionary new
]

{ #category : #'instance creation' }
AKUrlMatcher class >> fromString: aString constraints: aDictionary [
	^ super new
		initializeFromString: aString constraints: aDictionary
		yourself
]

{ #category : #'instance creation' }
AKUrlMatcher class >> new [
	self error: 'Use #fromString: or #fromString:constraints:'
]

{ #category : #private }
AKUrlMatcher >> atPlaceholder: aKey valueFrom: aPathString [
	^ (placeholders at: aKey) findValueIn: aPathString
]

{ #category : #private }
AKUrlMatcher >> buildPlaceholders [
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
AKUrlMatcher >> buildRegex [
	| regexStr |
	regexStr := path.
	placeholders do: [ :each | regexStr := each copyReplaceByRegexIn: regexStr ].
	pathRegex := regexStr asRegex
]

{ #category : #accessing }
AKUrlMatcher >> constraints [
	^ constraints
]

{ #category : #private }
AKUrlMatcher >> constraintsAt: aKey [
	^ constraints at: aKey ifAbsentPut: [ AKPlaceholderConstraint any ]
]

{ #category : #private }
AKUrlMatcher >> extractValuesFrom: aAKHttpRequest [
	<return: #Dictionary>
	|aPathString|
	aPathString := aAKHttpRequest unprefixedPath.
	^ (placeholders collect: [ :each | each findValueIn: aPathString ])
]

{ #category : #initialization }
AKUrlMatcher >> initializeFromString: aString constraints: aDictionary [
	path := aString.
	constraints := aDictionary.
	self
		buildPlaceholders;
		buildRegex
]

{ #category : #testing }
AKUrlMatcher >> matchRequest: anHttpRequest [
	^  pathRegex matches:	anHttpRequest unprefixedPath
]

{ #category : #accessing }
AKUrlMatcher >> path [
	^ path
]

{ #category : #private }
AKUrlMatcher >> placeholderValuesFrom: aPathString [
	<return: #Dictionary>
	
	^ (placeholders collect: [ :each | each findValueIn: aPathString ])
]

{ #category : #accessing }
AKUrlMatcher >> placeholders [
	^ placeholders
]

{ #category : #private }
AKUrlMatcher >> segmentPositionOf: aString [
	| strPosition stream position |
	strPosition := path findString: aString.
	stream := (path copyFrom:1  to: strPosition) readStream.
	position := 0.
	[ stream atEnd ] whileFalse: [
			stream next = $/ ifTrue: [ position := position + 1 ] ].
	^ position
]
