Class {
	#name : #AKHttpRequestTest,
	#superclass : #TestCase,
	#category : #'Alkalin-HttpServer-Tests'
}

{ #category : #tests }
AKHttpRequestTest >> testUnprefixedPath [
	| req |
	req := AKHttpRequest get: '/prefix1/prefix2/route/get'.
	
	req withPrefix: '/prefix1' do: [ self assert: req unprefixedPath = '/prefix2/route/get' ].
	self assert: req unprefixedPath = '/prefix1/prefix2/route/get'.
	self should: [ req pushPrefix: '/unknown' ] raise: AKInvalidPathPrefix.
	
	req 
		pushPrefix: '/prefix1';
	 	pushPrefix: '/prefix2'.
	self assert: req unprefixedPath = '/route/get'.
	
	req 
		popPrefix;
		popPrefix.
	self assert: req unprefixedPath = '/prefix1/prefix2/route/get'.
	
]
