Class {
	#name : #WCAction,
	#superclass : #Object,
	#traits : 'TWCAssertion',
	#classTraits : 'TWCAssertion classTrait',
	#category : #'WebCopper-HttpRouter-Action'
}

{ #category : #asserting }
WCAction class >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with ===AKGlobalSettings enableAssertions==="
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #asserting }
WCAction class >> assertionsEnabled [
	<return: #Boolean>
	^ WCGlobalSettings assertionsEnabled
]

{ #category : #converting }
WCAction >> asWCAction [
	^ self
]

{ #category : #executing }
WCAction >> executeForRequest: aAKHttpRequest [
	self subclassResponsibility  
]

{ #category : #testing }
WCAction >> isWCCallAction [
	^ false
]
