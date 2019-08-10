Class {
	#name : #WCHandlerMap,
	#superclass : #Object,
	#instVars : [
		'handlerMap',
		'resolver'
	],
	#category : #'WebCopper-Ubiq-Message'
}

{ #category : #accessing }
WCHandlerMap >> handle: aMessage [
	handlerMap
		at: aMessage class
		ifPresent: [ :h | h handle: aMessage ]
		ifAbsent: [ WCHandlerNotFound signalForMessage: aMessage ]
]

{ #category : #initialization }
WCHandlerMap >> initialize [
	super initialize.
	handlerMap := Dictionary new
]

{ #category : #accessing }
WCHandlerMap >> map: aMessageClass to: anInstance [
	handlerMap at: aMessageClass put: anInstance
]
