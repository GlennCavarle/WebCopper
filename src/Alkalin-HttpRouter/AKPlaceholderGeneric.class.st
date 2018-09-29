Class {
	#name : #AKPlaceholderGeneric,
	#superclass : #AKAbstractPlaceholderConstraint,
	#instVars : [
		'regex',
		'converter',
		'regexString'
	],
	#category : #'Alkalin-HttpRouter-Placeholder'
}

{ #category : #accessing }
AKPlaceholderGeneric class >> regexString: aRegexString [
	^ self
		regexString: aRegexString
		converter: [ :str | str asString ]
]

{ #category : #accessing }
AKPlaceholderGeneric class >> regexString: aRegexString converter: aBlock [
	^ self new
		regexString: aRegexString;
		converter: aBlock;
		yourself
]

{ #category : #accessing }
AKPlaceholderGeneric >> asRegexGroup [
	^ '(', regexString , ')'
]

{ #category : #converting }
AKPlaceholderGeneric >> convertFromString: aString [
	^ converter value: aString
]

{ #category : #accessing }
AKPlaceholderGeneric >> converter [
	^ converter
]

{ #category : #accessing }
AKPlaceholderGeneric >> converter: anObject [
	converter := anObject
]

{ #category : #testing }
AKPlaceholderGeneric >> matchesTo: aString [
	^ regex matches: aString
]

{ #category : #accessing }
AKPlaceholderGeneric >> regexString [
	^ regex
]

{ #category : #accessing }
AKPlaceholderGeneric >> regexString: aString [
	regexString := aString.
	regex := aString asRegex
]
