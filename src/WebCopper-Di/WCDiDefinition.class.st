Class {
	#name : #WCDiDefinition,
	#superclass : #Object,
	#traits : 'TWCAssertion',
	#classTraits : 'TWCAssertion classTrait',
	#instVars : [
		'identifier',
		'tags'
	],
	#category : #'WebCopper-Di-Definition'
}

{ #category : #asserting }
WCDiDefinition class >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with AKGlobalSettings enableAssertions"
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #asserting }
WCDiDefinition class >> assertionsEnabled [
	<return: #Boolean>
	^ WCGlobalSettings assertionsEnabled
]

{ #category : #evaluating }
WCDiDefinition >> createInstance: aServiceContainer [
	self subclassResponsibility
]

{ #category : #accessing }
WCDiDefinition >> identifier [
	^ identifier ifNil: [ Error signal: 'Service identifier is mandatory in ' , self className ]
]

{ #category : #accessing }
WCDiDefinition >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
WCDiDefinition >> tag: aAKServiceTag [
	self
		assert: [ aAKServiceTag isKindOf: WCDiTag ]
		description: [ 'Argument must be a AKServiceTag' ].
		
	self tags at: aAKServiceTag name put: aAKServiceTag
]

{ #category : #accessing }
WCDiDefinition >> tags [
	^ tags ifNil: [ tags := Dictionary new ]
]
