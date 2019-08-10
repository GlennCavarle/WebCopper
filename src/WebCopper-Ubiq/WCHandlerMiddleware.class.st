Class {
	#name : #WCHandlerMiddleware,
	#superclass : #Object,
	#instVars : [
		'handlers',
		'serviceContainer'
	],
	#category : #'WebCopper-Ubiq-Message'
}

{ #category : #dispatching }
WCHandlerMiddleware >> dispatch: aMessage [
	self dispatch: aMessage nextBlock: [ :arg |  ]
]

{ #category : #dispatching }
WCHandlerMiddleware >> dispatch: aMessage nextBlock: aNextBlock [
	handlers handle: aMessage.
	aNextBlock value
]

{ #category : #initialization }
WCHandlerMiddleware >> initialize [
	super initialize.
	handlers := WCHandlerMap new.
]

{ #category : #accessing }
WCHandlerMiddleware >> map: aMessageClass to: anHandlerTarget [
	| anInstance |
	anInstance := anHandlerTarget asWCRef resolveUsing: serviceContainer.
	handlers map: aMessageClass to: anInstance
]

{ #category : #accessing }
WCHandlerMiddleware >> serviceContainer: aServiceContainer [ 
	serviceContainer := aServiceContainer
]
