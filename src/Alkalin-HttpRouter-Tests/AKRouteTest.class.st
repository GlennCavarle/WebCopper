Class {
	#name : #AKRouteTest,
	#superclass : #TestCase,
	#category : #'Alkalin-HttpRouter-Tests'
}

{ #category : #tests }
AKRouteTest >> testRouteMatching [
	| route |
	route := AKRoute
		methods: #(GET)
		path: '/test/:id'
		constraints: {(#id -> AKPlaceholderConstraint int)} asDictionary
		action: (AKCallAction call: #action on: Object new).
	
	self assert: (route matchRequest: (AKHttpRequest get:'/test/42')).
	self assert: (route matchRequest: (AKHttpRequest get:'/test/aString')) not.
	self assert: (route matchRequest: (AKHttpRequest post:'/test/42')) not
]

{ #category : #tests }
AKRouteTest >> testRouteMatchingWithMultipleMethods [
	| route |
	route := AKRoute
		methods: #(GET POST)
		path: '/test/:id'
		constraints: {(#id -> AKPlaceholderConstraint int)} asDictionary
		action: (AKCallAction call: #action on: Object new).
	
	self assert: (route matchRequest: (AKHttpRequest get:'/test/42')).
	self assert: (route matchRequest: (AKHttpRequest post:'/test/42')) 
]

{ #category : #tests }
AKRouteTest >> testRoutePathToName [
	self assert: (AKRoute pathToName: '/') = #_.
	self assert: (AKRoute pathToName: '/test/route') = #_test_route.
	self assert: (AKRoute pathToName: '/test/route/') = #_test_route_.
	self assert: (AKRoute pathToName: '/test/route/:arg(int)') = #_test_route__arg_int_.
	self assert: (AKRoute pathToName: '/test/route/:arg(\d+[A-Z]{3})') = #_test_route__arg__d__A_Z__3__.
	"Warning : some route can have the same name for different regex expressions"
	self assert: (AKRoute pathToName: '/test/route/:arg(.d*[A-Z][3])') = #_test_route__arg__d__A_Z__3__
]
