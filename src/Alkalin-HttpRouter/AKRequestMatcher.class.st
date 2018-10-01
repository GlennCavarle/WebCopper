Class {
	#name : #AKRequestMatcher,
	#superclass : #AKAbstractRequestMatcher,
	#instVars : [
		'methodMatcher',
		'urlMatcher'
	],
	#category : #'Alkalin-HttpRouter-Matcher'
}

{ #category : #'instance creation' }
AKRequestMatcher class >> methods: anArray path: aString constraints: aDictionary [
	^ self new
		initializeWithMethods: anArray path: aString constraints: aDictionary;
		yourself
]

{ #category : #accessing }
AKRequestMatcher >> extractUrlValuesFrom: anHttpRequest [
	^ urlMatcher extractValuesFrom: anHttpRequest
]

{ #category : #initialization }
AKRequestMatcher >> initializeWithMethods: anArray path: aString constraints: aDictionary [
	methodMatcher := AKMethodMatcher fromArray: anArray.
	urlMatcher := AKUrlMatcher fromPathPattern: aString constraints: aDictionary
]

{ #category : #testing }
AKRequestMatcher >> matchRequest: anHttpRequest [
	^ (methodMatcher matchRequest: anHttpRequest)
		and: [ urlMatcher matchRequest: anHttpRequest ]
]

{ #category : #accessing }
AKRequestMatcher >> methods [
	^ methodMatcher methods
]

{ #category : #accessing }
AKRequestMatcher >> path [
	^ urlMatcher path
]
