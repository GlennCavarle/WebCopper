Class {
	#name : #WCRouteCollection,
	#superclass : #WCRouter,
	#traits : 'TWCAssertion',
	#classTraits : 'TWCAssertion classTrait',
	#instVars : [
		'routes',
		'prefix'
	],
	#category : #'WebCopper-HttpRouter-Router'
}

{ #category : #asserting }
WCRouteCollection class >> assertionsEnabled [
	<return: #Boolean>
	^ WCGlobalSettings assertionsEnabled
]

{ #category : #'instance creation' }
WCRouteCollection class >> configure: aBlock [
	| aRouteCollection |
	aRouteCollection := self new.
	aBlock value: aRouteCollection.
	^ aRouteCollection
]

{ #category : #'quick adding' }
WCRouteCollection >> CONNECT: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(CONNECT);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
WCRouteCollection >> DELETE: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(DELETE);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
WCRouteCollection >> GET: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(GET);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
WCRouteCollection >> HEAD: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(HEAD);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
WCRouteCollection >> OPTIONS: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(OPTIONS);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
WCRouteCollection >> PATCH: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(PATCH);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
WCRouteCollection >> POST: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(POST);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
WCRouteCollection >> PUT: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(PUT);
				action: patternActionAssoc value ]
]

{ #category : #'quick adding' }
WCRouteCollection >> TRACE: patternActionAssoc [
	self
		addRoute: [ :routeBuilder | 
			routeBuilder
				path: patternActionAssoc key;
				methods: #(TRACE);
				action: patternActionAssoc value ]
]

{ #category : #'adding/removing' }
WCRouteCollection >> addRoute: aBlock [
	| routeBuilder |
	routeBuilder := WCRouteBuilder new.
	aBlock value: routeBuilder.
	routes at: routeBuilder name put: routeBuilder buildRoute
]

{ #category : #asserting }
WCRouteCollection >> assertNoRouteDefined [
	self 
		assert:[ routes isEmpty ] 
		description: [ 'Some routes are already defined' ] 
]

{ #category : #'adding/removing' }
WCRouteCollection >> clear [
	routes removeAll.
]

{ #category : #'gt-extension' }
WCRouteCollection >> gtInspectorRoutesIn: composite [
	<gtInspectorPresentationOrder: 0>  
	
	^(composite list)
		title: ['Routes' translated];		 
		display: [ routes ]; 
		format: [:each | each printString ]
]

{ #category : #initialization }
WCRouteCollection >> initialize [
	super initialize.
	routes := Dictionary new.
]

{ #category : #testing }
WCRouteCollection >> matchRequest: aRequest [
	<return: #Boolean>
	(aRequest unprefixedPath isEmptyOrBeginsWith: self prefix) ifFalse: [ ^ false ].
	
	^ aRequest withPrefix: self prefix do: [ 
		routes anySatisfy: [ :route | route matchRequest: aRequest ].
	].
	
	
]

{ #category : #accessing }
WCRouteCollection >> prefix [
	^ prefix ifNil: [ prefix := String empty ]
]

{ #category : #accessing }
WCRouteCollection >> prefix: anObject [
	self assertNoRouteDefined.
	prefix := anObject.
]

{ #category : #accessing }
WCRouteCollection >> routeForRequest: aRequest [
	
	(aRequest unprefixedPath isEmptyOrBeginsWith: self prefix)
		ifFalse: [ WCRouteNotFound signalForRequest: aRequest ].
		
	aRequest pushPrefix: self prefix.
	^ routes 
		detect: [ :route | route matchRequest: aRequest ]
		ifNone: [ 
			aRequest popPrefix.
			WCRouteNotFound signalForRequest: aRequest ]
]

{ #category : #accessing }
WCRouteCollection >> routeNamed: aRouteName [
	^ routes at: aRouteName
]

{ #category : #accessing }
WCRouteCollection >> routeNames [
	^ routes keys
]

{ #category : #accessing }
WCRouteCollection >> routes [
	^ routes values
]
