Class {
	#name : #WCMethodMatcherTest,
	#superclass : #TestCase,
	#category : #'WebCopper-HttpRouter-Tests'
}

{ #category : #tests }
WCMethodMatcherTest >> test [
	|matcherGet matcherPost matcherGetPost matcherAny|
	matcherGet := WCMethodMatcher fromArray:#(GET).
	matcherPost := WCMethodMatcher fromArray:#(Post). 
	matcherGetPost := WCMethodMatcher fromArray:#(get poSt).
	matcherAny := WCMethodMatcher fromArray:#(Any). 
	
	self assert: (matcherGet matchRequest: (WCHttpRequest get:'/test')).
	self assert: (matcherGet matchRequest: (WCHttpRequest post:'/test')) not.
	
	self assert: (matcherPost matchRequest: (WCHttpRequest post:'/test')).
	self assert: (matcherPost matchRequest: (WCHttpRequest get:'/test')) not.
	
	self assert: (matcherGetPost matchRequest: (WCHttpRequest get:'/test')).
	self assert: (matcherGetPost matchRequest: (WCHttpRequest post:'/test')).
	self assert: (matcherGetPost matchRequest: (WCHttpRequest put:'/test')) not.
	
	self assert: (matcherAny matchRequest: (WCHttpRequest get:'/test')).
	self assert: (matcherAny matchRequest: (WCHttpRequest post:'/test')).
	self assert: (matcherAny matchRequest: (WCHttpRequest put:'/test'))
]
