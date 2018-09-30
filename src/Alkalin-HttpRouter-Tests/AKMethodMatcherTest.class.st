Class {
	#name : #AKMethodMatcherTest,
	#superclass : #TestCase,
	#category : #'Alkalin-HttpRouter-Tests'
}

{ #category : #tests }
AKMethodMatcherTest >> test [
	|matcherGet matcherPost matcherGetPost matcherAny|
	matcherGet := AKMethodMatcher fromArray:#(GET).
	matcherPost := AKMethodMatcher fromArray:#(Post). 
	matcherGetPost := AKMethodMatcher fromArray:#(get poSt).
	matcherAny := AKMethodMatcher fromArray:#(Any). 
	
	self assert: (matcherGet matchRequest: (AKHttpRequest get:'/test')).
	self assert: (matcherGet matchRequest: (AKHttpRequest post:'/test')) not.
	
	self assert: (matcherPost matchRequest: (AKHttpRequest post:'/test')).
	self assert: (matcherPost matchRequest: (AKHttpRequest get:'/test')) not.
	
	self assert: (matcherGetPost matchRequest: (AKHttpRequest get:'/test')).
	self assert: (matcherGetPost matchRequest: (AKHttpRequest post:'/test')).
	self assert: (matcherGetPost matchRequest: (AKHttpRequest put:'/test')) not.
	
	self assert: (matcherAny matchRequest: (AKHttpRequest get:'/test')).
	self assert: (matcherAny matchRequest: (AKHttpRequest post:'/test')).
	self assert: (matcherAny matchRequest: (AKHttpRequest put:'/test'))
]
