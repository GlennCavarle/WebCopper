Class {
	#name : #AKMethodMatcher,
	#superclass : #AKAbstractRequestMatcher,
	#instVars : [
		'methods',
		'allowsAll'
	],
	#category : #'Alkalin-HttpRouter-Matcher'
}

{ #category : #'instance creation' }
AKMethodMatcher class >> fromArray: anArray [
	^ super new
		initializeFromArray: anArray;
		yourself
]

{ #category : #testing }
AKMethodMatcher >> allowsAny [
	^ allowsAll
]

{ #category : #initialization }
AKMethodMatcher >> initialize [
	super initialize.
	allowsAll := false
]

{ #category : #initialization }
AKMethodMatcher >> initializeFromArray: anArray [
	methods := anArray collect: [ :each | each asUppercase asSymbol ].
	(methods size = 1 and: [ methods first = #ANY ]) ifTrue: [ allowsAll := true ]
]

{ #category : #testing }
AKMethodMatcher >> matchRequest: anHttpRequest [
	self allowsAny ifTrue: [ ^ true ].
	^ methods anySatisfy: [ :each | each = anHttpRequest method ]
]

{ #category : #accessing }
AKMethodMatcher >> methods [
	^ methods
]
