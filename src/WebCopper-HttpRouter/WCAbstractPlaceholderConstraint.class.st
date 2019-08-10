Class {
	#name : #WCAbstractPlaceholderConstraint,
	#superclass : #Object,
	#category : #'WebCopper-HttpRouter-Placeholder'
}

{ #category : #testing }
WCAbstractPlaceholderConstraint class >> asRegexGroup [
	^ '(', self regexString , ')'
]

{ #category : #testing }
WCAbstractPlaceholderConstraint class >> convertFromString: aString [
^ self converter value: aString
]

{ #category : #testing }
WCAbstractPlaceholderConstraint class >> converter [
	self subclassResponsibility 
]

{ #category : #'instance creation' }
WCAbstractPlaceholderConstraint class >> fromString: aString [
[ 
	(WCPlaceholderConstraint class selectors includes: aString asSymbol)
		ifTrue: [ ^ WCPlaceholderConstraint perform: aString asSymbol ].
	
	(aString isValidGlobalName and:[Smalltalk hasClassNamed: aString  ])
		ifTrue: [ ^ aString asClass ].
		
	^ WCPlaceholderGeneric regexString: aString.
] on: Error do:[WCInvalidPlaceholderConstraint signalForConstraint: aString]
	
	
	
]

{ #category : #testing }
WCAbstractPlaceholderConstraint class >> matchesTo: aString [
	^ self regexString asRegex matches: aString
]

{ #category : #testing }
WCAbstractPlaceholderConstraint class >> regexString [
	self subclassResponsibility 
]
