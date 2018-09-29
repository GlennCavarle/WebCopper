Class {
	#name : #AKServeStatic,
	#superclass : #Object,
	#traits : 'TAKRequestHandler',
	#classTraits : 'TAKRequestHandler classTrait',
	#instVars : [
		'delegate'
	],
	#category : #'Alkalin-HttpServer-Server'
}

{ #category : #configuring }
AKServeStatic class >> defaultStaticFileDelegate [
	^ ZnStaticFileServerDelegate new 
]

{ #category : #'instance creation' }
AKServeStatic class >> from: pathString [
	^ self new
		directory: pathString;
		yourself
]

{ #category : #public }
AKServeStatic >> directory: pathString [
	
	delegate directory: pathString asFileReference.
]

{ #category : #public }
AKServeStatic >> handleRequest: aAKHttpRequest [
	^ delegate handleRequest: aAKHttpRequest
]

{ #category : #initialization }
AKServeStatic >> initialize [
	super initialize.
	delegate := self class defaultStaticFileDelegate
]

{ #category : #public }
AKServeStatic >> prefix: urlPrefixString [
	| prefix |
	prefix := urlPrefixString first = $/
		ifTrue: [ urlPrefixString allButFirst ]
		ifFalse: [ urlPrefixString ].
		
	delegate prefixFromString: prefix
]

{ #category : #public }
AKServeStatic >> registredAtPrefix: aPrefix [
	self prefix: aPrefix
]
