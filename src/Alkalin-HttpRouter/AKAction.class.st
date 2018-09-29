Class {
	#name : #AKAction,
	#superclass : #Object,
	#traits : 'TAKAssertion',
	#classTraits : 'TAKAssertion classTrait',
	#category : #'Alkalin-HttpRouter-Action'
}

{ #category : #asserting }
AKAction class >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with ===AKGlobalSettings enableAssertions==="
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #asserting }
AKAction class >> assertionsEnabled [
	<return: #Boolean>
	^ AKGlobalSettings assertionsEnabled
]

{ #category : #converting }
AKAction >> asAKAction [
	^ self
]

{ #category : #executing }
AKAction >> executeForRequest: aAKHttpRequest [
	self subclassResponsibility  
]

{ #category : #testing }
AKAction >> isAKCallAction [
	^ false
]
