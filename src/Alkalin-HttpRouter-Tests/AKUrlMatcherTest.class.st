Class {
	#name : #AKUrlMatcherTest,
	#superclass : #TestCase,
	#category : #'Alkalin-HttpRouter-Tests'
}

{ #category : #asserting }
AKUrlMatcherTest >> assertUrlMatcher: aPathPattern matches: aDictionary [
	|matcher|
	matcher := AKUrlMatcher fromPathPattern: aPathPattern.
	
	aDictionary keysAndValuesDo: [ :k :v|
		self assert: (matcher matchRequest: (AKHttpRequest get:k)).
		
		v do:[:data| |argKey argType argValue|
			argKey := data first.
			argType := data second asClass.
			argValue := data third.
			
			self assert: ((matcher atPlaceholder:argKey valueFrom: k) isKindOf: argType).
			self assert: ((matcher atPlaceholder:argKey valueFrom: k) = argValue).
			
			]
		 ].
	
]

{ #category : #tests }
AKUrlMatcherTest >> testPathWithConstraint [
	
	"inline regex cannot be converted"
	self assertUrlMatcher:'/test/:arg1(\d+)' matches:{
			'/test/42' -> { 
					{#arg1. #String. '42'}}.
			} asDictionary.
			
	"more complex inline regex should mtch"
	self assertUrlMatcher:'/test/:arg1([A-Z]{3})' matches:{
			'/test/ABC' -> { 
					{#arg1. #String. 'ABC'}}.
			} asDictionary.
	
	self should: [ 
		self assertUrlMatcher:'/test/:arg1([A-Z]{3)' matches:{
			'/test/ABC' -> { 
					{#arg1. #String. 'ABC'}}.
			} asDictionary.
		 ] raise: AKInvalidPlaceholderConstraint .
	
	"convertion should work with predefined constraints (ex: AKPathConstraint integer)"
   self assertUrlMatcher:'/test/:arg1(int)' matches:{
			'/test/42' -> { 
					{#arg1. #Integer. 42}}.
			} asDictionary.
			
   self assertUrlMatcher:'/test/:arg1(word)' matches:{
			'/test/42' -> { 
					{#arg1. #String. '42'}}.
			} asDictionary.
	
	"convertion should work with constraint classes (ex: AKPlaceholderUuid)"
   self assertUrlMatcher:'/test/:arg1(AKPlaceholderUuid)' matches:{
			'/test/6a2f41a3-c54c-fce8-32d2-0324e1c32e22' -> { 
					{#arg1. #UUID. UUID fromString:'6a2f41a3-c54c-fce8-32d2-0324e1c32e22'}}.
			} asDictionary.
	
]

{ #category : #tests }
AKUrlMatcherTest >> testPathWithMultipleConstraints [
	
	"inline regex cannot be converted"
	self assertUrlMatcher:'/test/:arg1(\d+)/:arg2(int)' matches:{
			'/test/42/43' -> { 
					{#arg1. #String. '42'}.
					{#arg2. #Integer. 43}}.
			'/test/42/-43' -> { 
					{#arg1. #String. '42'}.
					{#arg2. #Integer. -43}}.
			} asDictionary.
	
]

{ #category : #tests }
AKUrlMatcherTest >> testPathWithMultipleSimpleArgs [

	self assertUrlMatcher:'/test/:arg1/test/:arg2' matches:{
			'/test/withString/test/42' -> #(
					#(#arg1 #String 'withString')
					#(#arg2 #String '42'))
			} asDictionary.
	
]

{ #category : #tests }
AKUrlMatcherTest >> testPathWithSimpleArg [

	self assertUrlMatcher:'/test/:arg' matches:{
			'/test/withString' -> #(#(#arg #String 'withString')).
			'/test/withString42' -> #(#(#arg #String 'withString42')).
			'/test/42' -> #(#(#arg #String '42'))
			} asDictionary.
	
]
