Trait {
	#name : #TWCAssertion,
	#category : #'WebCopper-Core-Utils'
}

{ #category : #asserting }
TWCAssertion classSide >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with AKGlobalSettings enableAssertions"
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #asserting }
TWCAssertion classSide >> assert: aBlock description: aStringOrBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	
	Note: Should be enabled with AKGlobalSettings enableAssertions"

	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: aStringOrBlock value ] ]
]

{ #category : #asserting }
TWCAssertion classSide >> assertionsEnabled [
	<return: #Boolean>
	^ WCGlobalSettings assertionsEnabled
]

{ #category : #asserting }
TWCAssertion >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true"
	
	self class assert: aBlock
]

{ #category : #asserting }
TWCAssertion >> assert: aBlock description: aStringOrBlock [
	"Throw an assertion error if aBlock does not evaluates to true."

	self class assert: aBlock description: aStringOrBlock
]
