Class {
	#name : #WCRouteBuilder,
	#superclass : #Object,
	#instVars : [
		'name',
		'prefix',
		'path',
		'methods',
		'action',
		'defaults',
		'constraints'
	],
	#category : #'WebCopper-HttpRouter-Route'
}

{ #category : #accessing }
WCRouteBuilder >> action [
	^ action ifNil:[[ WCRoutingException signal: 'Route must have an "action"' ]]
]

{ #category : #public }
WCRouteBuilder >> action: anObject [
	action := anObject asWCAction
]

{ #category : #building }
WCRouteBuilder >> buildRoute [
	^ WCRoute
		name: self name
		methods: self methods
		path: self path
		constraints: self constraints
		action: self action
]

{ #category : #public }
WCRouteBuilder >> callAction: aSymbol on: aReceiver [
	self action: (WCCallAction call: aSymbol on: aReceiver)
]

{ #category : #accessing }
WCRouteBuilder >> constraints [
	^ constraints ifNil: [ Dictionary new ]
]

{ #category : #public }
WCRouteBuilder >> constraints: anObject [
	constraints := anObject asDictionary
]

{ #category : #accessing }
WCRouteBuilder >> defaults [
	^ defaults ifNil: [ #() ]
]

{ #category : #public }
WCRouteBuilder >> defaults: anObject [
	defaults := anObject
]

{ #category : #public }
WCRouteBuilder >> method: aSymbol [
	methods := {aSymbol}
]

{ #category : #public }
WCRouteBuilder >> method: aSymbol path: aPath [
	self
		method: aSymbol;
		path: aPath
]

{ #category : #accessing }
WCRouteBuilder >> methods [
	^ methods ifNil: [ WCRoutingException signal: 'Route must have one "method", at least (GET|POST|...)' ]
]

{ #category : #public }
WCRouteBuilder >> methods: anObject [
	methods := anObject
]

{ #category : #public }
WCRouteBuilder >> methods: aCollection path: aPath [
	self
		methods: aCollection;
		path: aPath
]

{ #category : #accessing }
WCRouteBuilder >> name [
	^ name ifNil: [ name := (WCRoute pathToName: self path) ]
]

{ #category : #public }
WCRouteBuilder >> name: anObject [
	name := anObject
]

{ #category : #accessing }
WCRouteBuilder >> path [
	^ path ifNil: [ WCRoutingException signal: 'Route must have a "path"' ]
]

{ #category : #public }
WCRouteBuilder >> path: anObject [
	path := anObject
]

{ #category : #printing }
WCRouteBuilder >> printOn: aStream [
	aStream
		nextPutAll: self className;
		nextPut: $[;
		nextPutAll: (self methods joinUsing: '|');
		nextPutAll: '] : ';
		nextPutAll: self path;
		nextPutAll: ' -> ( ';
		nextPutAll: self action asString;
		nextPutAll: ' )'
]
