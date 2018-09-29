Class {
	#name : #AKAbstractPlaceholderConstraint,
	#superclass : #Object,
	#category : #'Alkalin-HttpRouter-Placeholder'
}

{ #category : #testing }
AKAbstractPlaceholderConstraint class >> asRegexGroup [
	^ '(', self regexString , ')'
]

{ #category : #testing }
AKAbstractPlaceholderConstraint class >> convertFromString: aString [
^ self converter value: aString
]

{ #category : #testing }
AKAbstractPlaceholderConstraint class >> converter [
	self subclassResponsibility 
]

{ #category : #'instance creation' }
AKAbstractPlaceholderConstraint class >> fromString: aString [
[ 
	(AKPlaceholderConstraint class selectors includes: aString asSymbol)
		ifTrue: [ ^ AKPlaceholderConstraint perform: aString asSymbol ].
	
	(aString isValidGlobalName and:[Smalltalk hasClassNamed: aString  ])
		ifTrue: [ ^ aString asClass ].
		
	^ AKPlaceholderGeneric regexString: aString.
] on: Error do:[AKInvalidPlaceholderConstraint signalForConstraint: aString]
	
	
	
]

{ #category : #testing }
AKAbstractPlaceholderConstraint class >> matchesTo: aString [
	^ self regexString asRegex matches: aString
]

{ #category : #testing }
AKAbstractPlaceholderConstraint class >> regexString [
	self subclassResponsibility 
]
