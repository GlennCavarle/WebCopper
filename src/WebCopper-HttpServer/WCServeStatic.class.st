Class {
	#name : #WCServeStatic,
	#superclass : #Object,
	#traits : 'TWCRequestHandler',
	#classTraits : 'TWCRequestHandler classTrait',
	#instVars : [
		'delegate'
	],
	#category : #'WebCopper-HttpServer-Server'
}

{ #category : #configuring }
WCServeStatic class >> defaultStaticFileDelegate [
	^ ZnStaticFileServerDelegate new 
]

{ #category : #'instance creation' }
WCServeStatic class >> from: pathString [
	^ self new
		directory: pathString;
		yourself
]

{ #category : #public }
WCServeStatic >> directory: pathString [
	
	delegate directory: pathString asFileReference.
]

{ #category : #public }
WCServeStatic >> handleRequest: aAKHttpRequest [
	^ delegate handleRequest: aAKHttpRequest
]

{ #category : #initialization }
WCServeStatic >> initialize [
	super initialize.
	delegate := self class defaultStaticFileDelegate
]

{ #category : #public }
WCServeStatic >> prefix: urlPrefixString [
	| prefix |
	prefix := urlPrefixString first = $/
		ifTrue: [ urlPrefixString allButFirst ]
		ifFalse: [ urlPrefixString ].
		
	delegate prefixFromString: prefix
]

{ #category : #public }
WCServeStatic >> registredAtPrefix: aPrefix [
	self prefix: aPrefix
]
