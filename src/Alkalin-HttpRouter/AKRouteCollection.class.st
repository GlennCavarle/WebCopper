Class {
	#name : #AKRouteCollection,
	#superclass : #AKRouter,
	#traits : 'TAKAssertion',
	#classTraits : 'TAKAssertion classTrait',
	#instVars : [
		'routes',
		'prefix'
	],
	#category : #'Alkalin-HttpRouter-Router'
}

{ #category : #asserting }
AKRouteCollection class >> assertionsEnabled [
	<return: #Boolean>
	^ AKGlobalSettings assertionsEnabled
]

{ #category : #'instance creation' }
AKRouteCollection class >> configure: aBlock [
	| aRouteCollection |
	aRouteCollection := self new.
	aBlock value: aRouteCollection.
	^ aRouteCollection
]

{ #category : #'quick adding' }
AKRouteCollection >> CONNECT: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(CONNECT);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
AKRouteCollection >> DELETE: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(DELETE);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
AKRouteCollection >> GET: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(GET);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
AKRouteCollection >> HEAD: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(HEAD);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
AKRouteCollection >> OPTIONS: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(OPTIONS);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
AKRouteCollection >> PATCH: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(PATCH);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
AKRouteCollection >> POST: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(POST);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
AKRouteCollection >> PUT: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(PUT);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
AKRouteCollection >> TRACE: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(TRACE);
				action: patternActionAssoc value ]
]

{ #category : #'adding/removing' }
AKRouteCollection >> addRoute: aBlock [
	| routeBuilder |
	routeBuilder := AKRouteBuilder new.
	aBlock value: routeBuilder.
	routes at: routeBuilder name put: routeBuilder buildRoute
]

{ #category : #asserting }
AKRouteCollection >> assertNoRouteDefined [
	self 
		assert:[ routes isEmpty ] 
		description: [ 'Some routes are already defined' ] 
]

{ #category : #'adding/removing' }
AKRouteCollection >> clear [
	routes removeAll.
]

{ #category : #initialization }
AKRouteCollection >> initialize [
	super initialize.
	routes := Dictionary new.
]

{ #category : #testing }
AKRouteCollection >> matchRequest: aRequest [
	<return: #Boolean>
	(aRequest unprefixedPath isEmptyOrBeginsWith: self prefix) ifFalse: [ ^ false ].
	
	^ aRequest withPrefix: self prefix do: [ 
		routes anySatisfy: [ :route | route matchRequest: aRequest ].
	].
	
	
]

{ #category : #accessing }
AKRouteCollection >> prefix [
	^ prefix ifNil: [ prefix := String empty ]
]

{ #category : #accessing }
AKRouteCollection >> prefix: anObject [
	self assertNoRouteDefined.
	prefix := anObject.
]

{ #category : #accessing }
AKRouteCollection >> routeForRequest: aRequest [
	
	(aRequest unprefixedPath isEmptyOrBeginsWith: self prefix)
		ifFalse: [ AKRouteNotFound signalForRequest: aRequest ].
		
	aRequest pushPrefix: self prefix.
	^ routes 
		detect: [ :route | route matchRequest: aRequest ]
		ifNone: [ 
			aRequest popPrefix.
			AKRouteNotFound signalForRequest: aRequest ]
]

{ #category : #accessing }
AKRouteCollection >> routeNamed: aRouteName [
	^ routes at: aRouteName
]

{ #category : #accessing }
AKRouteCollection >> routeNames [
	^ routes keys
]

{ #category : #accessing }
AKRouteCollection >> routes [
	^ routes values
]
