Class {
	#name : #WCRequestMatcher,
	#superclass : #WCAbstractRequestMatcher,
	#instVars : [
		'methodMatcher',
		'urlMatcher'
	],
	#category : #'WebCopper-HttpRouter-Matcher'
}

{ #category : #'instance creation' }
WCRequestMatcher class >> methods: anArray path: aString constraints: aDictionary [
	^ self new
		initializeWithMethods: anArray path: aString constraints: aDictionary;
		yourself
]

{ #category : #accessing }
WCRequestMatcher >> extractUrlValuesFrom: anHttpRequest [
	^ urlMatcher extractValuesFrom: anHttpRequest
]

{ #category : #initialization }
WCRequestMatcher >> initializeWithMethods: anArray path: aString constraints: aDictionary [
	methodMatcher := WCMethodMatcher fromArray: anArray.
	urlMatcher := WCUrlMatcher fromPathPattern: aString constraints: aDictionary
]

{ #category : #testing }
WCRequestMatcher >> matchRequest: anHttpRequest [
	^ (methodMatcher matchRequest: anHttpRequest)
		and: [ urlMatcher matchRequest: anHttpRequest ]
]

{ #category : #accessing }
WCRequestMatcher >> methods [
	^ methodMatcher methods
]

{ #category : #accessing }
WCRequestMatcher >> path [
	^ urlMatcher path
]
