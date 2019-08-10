Class {
	#name : #WCRouteTest,
	#superclass : #TestCase,
	#category : #'WebCopper-HttpRouter-Tests'
}

{ #category : #tests }
WCRouteTest >> testRouteMatching [
	| route |
	route := WCRoute
		methods: #(GET)
		path: '/test/:id'
		constraints: {(#id -> WCPlaceholderConstraint int)} asDictionary
		action: (WCCallAction call: #action on: Object new).
	
	self assert: (route matchRequest: (WCHttpRequest get:'/test/42')).
	self assert: (route matchRequest: (WCHttpRequest get:'/test/aString')) not.
	self assert: (route matchRequest: (WCHttpRequest post:'/test/42')) not
]

{ #category : #tests }
WCRouteTest >> testRouteMatchingWithMultipleMethods [
	| route |
	route := WCRoute
		methods: #(GET POST)
		path: '/test/:id'
		constraints: {(#id -> WCPlaceholderConstraint int)} asDictionary
		action: (WCCallAction call: #action on: Object new).
	
	self assert: (route matchRequest: (WCHttpRequest get:'/test/42')).
	self assert: (route matchRequest: (WCHttpRequest post:'/test/42')) 
]

{ #category : #tests }
WCRouteTest >> testRoutePathToName [
	self assert: (WCRoute pathToName: '/') = #_.
	self assert: (WCRoute pathToName: '/test/route') = #_test_route.
	self assert: (WCRoute pathToName: '/test/route/') = #_test_route_.
	self assert: (WCRoute pathToName: '/test/route/:arg(int)') = #_test_route__arg_int_.
	self assert: (WCRoute pathToName: '/test/route/:arg(\d+[A-Z]{3})') = #_test_route__arg__d__A_Z__3__.
	"Warning : some route can have the same name for different regex expressions"
	self assert: (WCRoute pathToName: '/test/route/:arg(.d*[A-Z][3])') = #_test_route__arg__d__A_Z__3__
]
