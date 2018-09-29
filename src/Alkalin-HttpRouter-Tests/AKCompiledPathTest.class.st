Class {
	#name : #AKCompiledPathTest,
	#superclass : #TestCase,
	#category : #'Alkalin-HttpRouter-Tests'
}

{ #category : #asserting }
AKCompiledPathTest >> assertCompiledPath: aPathPattern matches: aDictionary [
	|cp|
	cp := AKCompiledPath fromString: aPathPattern.
	
	aDictionary keysAndValuesDo: [ :k :v|
		self assert: (cp match: k).
		
		v do:[:data| |argKey argType argValue|
			argKey := data first.
			argType := data second asClass.
			argValue := data third.
			
			self assert: ((cp atPlaceholder:argKey valueFrom: k) isKindOf: argType).
			self assert: ((cp atPlaceholder:argKey valueFrom: k) = argValue).
			
			]
		 ].
	
]

{ #category : #tests }
AKCompiledPathTest >> testPathWithConstraint [
	
	"inline regex cannot be converted"
	self assertCompiledPath:'/test/:arg1(\d+)' matches:{
			'/test/42' -> { 
					{#arg1. #String. '42'}}.
			} asDictionary.
			
	"more complex inline regex should mtch"
	self assertCompiledPath:'/test/:arg1([A-Z]{3})' matches:{
			'/test/ABC' -> { 
					{#arg1. #String. 'ABC'}}.
			} asDictionary.
	
	self should: [ 
		self assertCompiledPath:'/test/:arg1([A-Z]{3)' matches:{
			'/test/ABC' -> { 
					{#arg1. #String. 'ABC'}}.
			} asDictionary.
		 ] raise: AKInvalidPlaceholderConstraint .
	
	"convertion should work with predefined constraints (ex: AKPathConstraint integer)"
   self assertCompiledPath:'/test/:arg1(int)' matches:{
			'/test/42' -> { 
					{#arg1. #Integer. 42}}.
			} asDictionary.
			
   self assertCompiledPath:'/test/:arg1(word)' matches:{
			'/test/42' -> { 
					{#arg1. #String. '42'}}.
			} asDictionary.
	
	"convertion should work with constraint classes (ex: AKPlaceholderUuid)"
   self assertCompiledPath:'/test/:arg1(AKPlaceholderUuid)' matches:{
			'/test/6a2f41a3-c54c-fce8-32d2-0324e1c32e22' -> { 
					{#arg1. #UUID. UUID fromString:'6a2f41a3-c54c-fce8-32d2-0324e1c32e22'}}.
			} asDictionary.
	
]

{ #category : #tests }
AKCompiledPathTest >> testPathWithMultipleConstraints [
	
	"inline regex cannot be converted"
	self assertCompiledPath:'/test/:arg1(\d+)/:arg2(int)' matches:{
			'/test/42/43' -> { 
					{#arg1. #String. '42'}.
					{#arg2. #Integer. 43}}.
			'/test/42/-43' -> { 
					{#arg1. #String. '42'}.
					{#arg2. #Integer. -43}}.
			} asDictionary.
	
]

{ #category : #tests }
AKCompiledPathTest >> testPathWithMultipleSimpleArgs [

	self assertCompiledPath:'/test/:arg1/test/:arg2' matches:{
			'/test/withString/test/42' -> #(
					#(#arg1 #String 'withString')
					#(#arg2 #String '42'))
			} asDictionary.
	
]

{ #category : #tests }
AKCompiledPathTest >> testPathWithSimpleArg [

	self assertCompiledPath:'/test/:arg' matches:{
			'/test/withString' -> #(#(#arg #String 'withString')).
			'/test/withString42' -> #(#(#arg #String 'withString42')).
			'/test/42' -> #(#(#arg #String '42'))
			} asDictionary.
	
]
