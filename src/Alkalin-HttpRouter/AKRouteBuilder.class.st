Class {
	#name : #AKRouteBuilder,
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
	#category : #'Alkalin-HttpRouter-Route'
}

{ #category : #accessing }
AKRouteBuilder >> action [
	^ action ifNil:[[ AKRoutingException signal: 'Route must have an "action"' ]]
]

{ #category : #public }
AKRouteBuilder >> action: anObject [
	action := anObject asAKAction
]

{ #category : #building }
AKRouteBuilder >> buildRoute [
	^ AKRoute
		name: self name
		methods: self methods
		path: self path
		constraints: self constraints
		action: self action
]

{ #category : #public }
AKRouteBuilder >> call: aSymbol on: aReceiver [
	self action: (AKCallAction call: aSymbol on: aReceiver)
]

{ #category : #accessing }
AKRouteBuilder >> constraints [
	^ constraints ifNil: [ Dictionary new ]
]

{ #category : #public }
AKRouteBuilder >> constraints: anObject [
	constraints := anObject asDictionary
]

{ #category : #accessing }
AKRouteBuilder >> defaults [
	^ defaults ifNil: [ #() ]
]

{ #category : #public }
AKRouteBuilder >> defaults: anObject [
	defaults := anObject
]

{ #category : #public }
AKRouteBuilder >> method: aSymbol [
	methods := {aSymbol}
]

{ #category : #public }
AKRouteBuilder >> method: aSymbol path: aPath [
	self
		method: aSymbol;
		path: aPath
]

{ #category : #accessing }
AKRouteBuilder >> methods [
	^ methods ifNil: [ AKRoutingException signal: 'Route must have one "method", at least (GET|POST|...)' ]
]

{ #category : #public }
AKRouteBuilder >> methods: anObject [
	methods := anObject
]

{ #category : #public }
AKRouteBuilder >> methods: aCollection path: aPath [
	self
		methods: aCollection;
		path: aPath
]

{ #category : #accessing }
AKRouteBuilder >> name [
	^ name ifNil: [ name := (AKRoute pathToName: self path) ]
]

{ #category : #public }
AKRouteBuilder >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AKRouteBuilder >> path [
	^ path ifNil: [ AKRoutingException signal: 'Route must have a "path"' ]
]

{ #category : #public }
AKRouteBuilder >> path: anObject [
	path := anObject
]

{ #category : #printing }
AKRouteBuilder >> printOn: aStream [
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
