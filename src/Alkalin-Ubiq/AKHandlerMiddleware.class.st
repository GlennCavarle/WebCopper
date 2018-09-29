Class {
	#name : #AKHandlerMiddleware,
	#superclass : #Object,
	#instVars : [
		'handlers',
		'serviceContainer'
	],
	#category : #'Alkalin-Ubiq-Message'
}

{ #category : #dispatching }
AKHandlerMiddleware >> dispatch: aMessage [
	self dispatch: aMessage nextBlock: [ :arg |  ]
]

{ #category : #dispatching }
AKHandlerMiddleware >> dispatch: aMessage nextBlock: aNextBlock [
	handlers handle: aMessage.
	aNextBlock value
]

{ #category : #initialization }
AKHandlerMiddleware >> initialize [
	super initialize.
	handlers := AKHandlerMap new.
]

{ #category : #accessing }
AKHandlerMiddleware >> map: aMessageClass to: anHandlerTarget [
	| anInstance |
	anInstance := anHandlerTarget asAKRef resolveUsing: serviceContainer.
	handlers map: aMessageClass to: anInstance
]

{ #category : #accessing }
AKHandlerMiddleware >> serviceContainer: aServiceContainer [ 
	serviceContainer := aServiceContainer
]
