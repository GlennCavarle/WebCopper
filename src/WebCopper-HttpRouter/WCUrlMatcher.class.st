Class {
	#name : #WCUrlMatcher,
	#superclass : #WCAbstractRequestMatcher,
	#instVars : [
		'placeholders',
		'path',
		'constraints',
		'pathRegex'
	],
	#category : #'WebCopper-HttpRouter-Matcher'
}

{ #category : #'instance creation' }
WCUrlMatcher class >> fromPathPattern: aString [
	^ self fromPathPattern: aString constraints: Dictionary new
]

{ #category : #'instance creation' }
WCUrlMatcher class >> fromPathPattern: aString constraints: aDictionary [
	^ super new
		initializeFromPathPattern: aString constraints: aDictionary
		yourself
]

{ #category : #'instance creation' }
WCUrlMatcher class >> fromRegex: aStringOrRegex [
	^ super new
		initializeFromRegex: aStringOrRegex asRegex;
		yourself
]

{ #category : #'instance creation' }
WCUrlMatcher class >> new [
	self error: 'Use #fromString: or #fromString:constraints:'
]

{ #category : #private }
WCUrlMatcher >> atPlaceholder: aKey valueFrom: aPathString [
	^ (placeholders at: aKey) findValueIn: aPathString
]

{ #category : #private }
WCUrlMatcher >> buildPlaceholders [
	| phRegex|
	placeholders := Dictionary new.
	phRegex := '\:(\w+)(\(([^/]+)\))?' asRegex.
	phRegex  matchesIn: path  subexpressionsDo: [ :s :ss | 
			(ss at: 3) ifNotNil:[
			 	constraints at: ss first put: (WCPlaceholderConstraint fromString: (ss at:3))
			].
			placeholders at: ss first put:
					(WCPlaceholder
						name: ss first
						pattern: s
						position: (self segmentPositionOf: ss first)
						constraint: (self constraintsAt: ss first)) ]
]

{ #category : #private }
WCUrlMatcher >> buildRegex [
	| regexStr |
	regexStr := '^',path.
	placeholders do: [ :each | regexStr := each copyReplaceByRegexIn: regexStr ].
	pathRegex := regexStr asRegex
]

{ #category : #accessing }
WCUrlMatcher >> constraints [
	^ constraints
]

{ #category : #private }
WCUrlMatcher >> constraintsAt: aKey [
	^ constraints at: aKey ifAbsentPut: [ WCPlaceholderConstraint any ]
]

{ #category : #private }
WCUrlMatcher >> extractValuesFrom: aAKHttpRequest [
	<return: #Dictionary>
	|aPathString|
	aPathString := aAKHttpRequest unprefixedPath.
	^ (placeholders collect: [ :each | each findValueIn: aPathString ])
]

{ #category : #initialization }
WCUrlMatcher >> initializeFromPathPattern: aString constraints: aDictionary [
	path := aString.
	constraints := aDictionary.
	self
		buildPlaceholders;
		buildRegex
]

{ #category : #initialization }
WCUrlMatcher >> initializeFromRegex: aRegex [
	path := ''.
	constraints := Dictionary new.
	pathRegex := aRegex
]

{ #category : #testing }
WCUrlMatcher >> matchRequest: anHttpRequest [
	^  pathRegex matches:	anHttpRequest unprefixedPath
]

{ #category : #accessing }
WCUrlMatcher >> path [
	^ path
]

{ #category : #private }
WCUrlMatcher >> placeholderValuesFrom: aPathString [
	<return: #Dictionary>
	
	^ (placeholders collect: [ :each | each findValueIn: aPathString ])
]

{ #category : #accessing }
WCUrlMatcher >> placeholders [
	^ placeholders
]

{ #category : #private }
WCUrlMatcher >> segmentPositionOf: aString [
	| strPosition stream position |
	strPosition := path findString: aString.
	stream := (path copyFrom:1  to: strPosition) readStream.
	position := 0.
	[ stream atEnd ] whileFalse: [
			stream next = $/ ifTrue: [ position := position + 1 ] ].
	^ position
]
