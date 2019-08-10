Class {
	#name : #WCPlaceholderGeneric,
	#superclass : #WCAbstractPlaceholderConstraint,
	#instVars : [
		'regex',
		'converter',
		'regexString'
	],
	#category : #'WebCopper-HttpRouter-Placeholder'
}

{ #category : #accessing }
WCPlaceholderGeneric class >> regexString: aRegexString [
	^ self
		regexString: aRegexString
		converter: [ :str | str asString ]
]

{ #category : #accessing }
WCPlaceholderGeneric class >> regexString: aRegexString converter: aBlock [
	^ self new
		regexString: aRegexString;
		converter: aBlock;
		yourself
]

{ #category : #accessing }
WCPlaceholderGeneric >> asRegexGroup [
	^ '(', regexString , ')'
]

{ #category : #converting }
WCPlaceholderGeneric >> convertFromString: aString [
	^ converter value: aString
]

{ #category : #accessing }
WCPlaceholderGeneric >> converter [
	^ converter
]

{ #category : #accessing }
WCPlaceholderGeneric >> converter: anObject [
	converter := anObject
]

{ #category : #testing }
WCPlaceholderGeneric >> matchesTo: aString [
	^ regex matches: aString
]

{ #category : #accessing }
WCPlaceholderGeneric >> regexString [
	^ regex
]

{ #category : #accessing }
WCPlaceholderGeneric >> regexString: aString [
	regexString := aString.
	regex := aString asRegex
]
