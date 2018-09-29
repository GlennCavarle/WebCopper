Trait {
	#name : #TAKAssertion,
	#category : #'Alkalin-Core-Utils'
}

{ #category : #asserting }
TAKAssertion classSide >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with AKGlobalSettings enableAssertions"
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #asserting }
TAKAssertion classSide >> assert: aBlock description: aStringOrBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	
	Note: Should be enabled with AKGlobalSettings enableAssertions"

	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: aStringOrBlock value ] ]
]

{ #category : #asserting }
TAKAssertion classSide >> assertionsEnabled [
	<return: #Boolean>
	^ AKGlobalSettings assertionsEnabled
]

{ #category : #asserting }
TAKAssertion >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true"
	
	self class assert: aBlock
]

{ #category : #asserting }
TAKAssertion >> assert: aBlock description: aStringOrBlock [
	"Throw an assertion error if aBlock does not evaluates to true."

	self class assert: aBlock description: aStringOrBlock
]
