Class {
	#name : #AKDiDefinition,
	#superclass : #Object,
	#traits : 'TAKAssertion',
	#classTraits : 'TAKAssertion classTrait',
	#instVars : [
		'identifier',
		'tags'
	],
	#category : #'Alkalin-Di-Definition'
}

{ #category : #asserting }
AKDiDefinition class >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with AKGlobalSettings enableAssertions"
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #asserting }
AKDiDefinition class >> assertionsEnabled [
	<return: #Boolean>
	^ AKGlobalSettings assertionsEnabled
]

{ #category : #evaluating }
AKDiDefinition >> createInstance: aServiceContainer [
	self subclassResponsibility
]

{ #category : #accessing }
AKDiDefinition >> identifier [
	^ identifier ifNil: [ Error signal: 'Service identifier is mandatory in ' , self className ]
]

{ #category : #accessing }
AKDiDefinition >> identifier: anObject [
	identifier := anObject
]

{ #category : #accessing }
AKDiDefinition >> tag: aAKServiceTag [
	self
		assert: [ aAKServiceTag isKindOf: AKDiTag ]
		description: [ 'Argument must be a AKServiceTag' ].
		
	self tags at: aAKServiceTag name put: aAKServiceTag
]

{ #category : #accessing }
AKDiDefinition >> tags [
	^ tags ifNil: [ tags := Dictionary new ]
]
