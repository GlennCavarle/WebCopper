Class {
	#name : #WCHttpRequestTest,
	#superclass : #TestCase,
	#category : #'WebCopper-HttpMessage-Tests'
}

{ #category : #tests }
WCHttpRequestTest >> testUnprefixedPath [
	| req |
	req := WCHttpRequest get: '/prefix1/prefix2/route/get'.
	
	req withPrefix: '/prefix1' do: [ self assert: req unprefixedPath = '/prefix2/route/get' ].
	self assert: req unprefixedPath = '/prefix1/prefix2/route/get'.
	self should: [ req pushPrefix: '/unknown' ] raise: WCInvalidPathPrefix.
	
	req 
		pushPrefix: '/prefix1';
	 	pushPrefix: '/prefix2'.
	self assert: req unprefixedPath = '/route/get'.
	
	req 
		popPrefix;
		popPrefix.
	self assert: req unprefixedPath = '/prefix1/prefix2/route/get'.
	
]
