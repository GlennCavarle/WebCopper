Class {
	#name : #WCMethodMatcher,
	#superclass : #WCAbstractRequestMatcher,
	#instVars : [
		'methods',
		'allowsAll'
	],
	#category : #'WebCopper-HttpRouter-Matcher'
}

{ #category : #'instance creation' }
WCMethodMatcher class >> fromArray: anArray [
	^ super new
		initializeFromArray: anArray;
		yourself
]

{ #category : #testing }
WCMethodMatcher >> allowsAny [
	^ allowsAll
]

{ #category : #initialization }
WCMethodMatcher >> initialize [
	super initialize.
	allowsAll := false
]

{ #category : #initialization }
WCMethodMatcher >> initializeFromArray: anArray [
	methods := anArray collect: [ :each | each asUppercase asSymbol ].
	(methods size = 1 and: [ methods first = #ANY ]) ifTrue: [ allowsAll := true ]
]

{ #category : #testing }
WCMethodMatcher >> matchRequest: anHttpRequest [
	self allowsAny ifTrue: [ ^ true ].
	^ methods anySatisfy: [ :each | each = anHttpRequest method ]
]

{ #category : #accessing }
WCMethodMatcher >> methods [
	^ methods
]
