Class {
	#name : #AKHandlerMap,
	#superclass : #Object,
	#instVars : [
		'handlerMap',
		'resolver'
	],
	#category : #'Alkalin-Ubiq-Message'
}

{ #category : #accessing }
AKHandlerMap >> handle: aMessage [
	handlerMap
		at: aMessage class
		ifPresent: [ :h | h handle: aMessage ]
		ifAbsent: [ AKHandlerNotFound signalForMessage: aMessage ]
]

{ #category : #initialization }
AKHandlerMap >> initialize [
	super initialize.
	handlerMap := Dictionary new
]

{ #category : #accessing }
AKHandlerMap >> map: aMessageClass to: anInstance [
	handlerMap at: aMessageClass put: anInstance
]
