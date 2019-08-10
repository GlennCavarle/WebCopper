Class {
	#name : #WCRouteCollectionTest,
	#superclass : #TestCase,
	#category : #'WebCopper-HttpRouter-Tests'
}

{ #category : #tests }
WCRouteCollectionTest >> testAddingSyntaxes [
	|rc|
	
rc := WCRouteCollection new.

rc 
	prefix:'/api';
	GET:'/route/get' -> [ :req| "do something"];
	
	addRoute:[:rb| rb
		path:'/route/:id(\d+)';
		method: #GET;
		action:[ :req| "do something"]];
	
	addRoute: [:rb| rb
		name:#my_route;
		path:'/my/route/:id(\d+)';
		method: #GET;
		action:[ :req| "do something"]].
	
self assert: (rc routes size = 3).
self assert: (rc routeNames includes:#my_route).
self assert: (rc routeNamed:#my_route) path = '/my/route/:id(\d+)'.
self assert: (rc matchRequest: (WCHttpRequest get:'/api/route/12')).

]

{ #category : #tests }
WCRouteCollectionTest >> testPrefixMatching [
	|rc|
	
rc := WCRouteCollection new.

rc 
	prefix:'/api';
	GET:'/route/get' -> [ :req| "do something"];
	GET:'/route/:id(\d+)' -> [ :req| "do something"].
	
self assert: (rc matchRequest: (WCHttpRequest get:'/api/route/get')).
self assert: (rc matchRequest: (WCHttpRequest get:'/api/route/12')).

self assert: (rc matchRequest: (WCHttpRequest get:'/route/get')) not.
self assert: (rc matchRequest: (WCHttpRequest get:'/route/12')) not.
]
