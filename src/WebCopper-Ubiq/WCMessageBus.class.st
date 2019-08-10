Class {
	#name : #WCMessageBus,
	#superclass : #Object,
	#instVars : [
		'middlewares'
	],
	#category : #'WebCopper-Ubiq-Message'
}

{ #category : #accessing }
WCMessageBus >> addMiddleware: aMiddleware [
	middlewares add: aMiddleware
]

{ #category : #accessing }
WCMessageBus >> clear [
	middlewares removeAll
]

{ #category : #dispatching }
WCMessageBus >> dispatch: aMessage [
	middlewares ifEmpty: [ ^ self ].
	self dispatch: aMessage next: middlewares firstLink
]

{ #category : #dispatching }
WCMessageBus >> dispatch: aMessage next: aMiddlewareLink [
	| nextBlock |
	nextBlock := aMiddlewareLink nextLink
		ifNil: [ [  ] ]
		ifNotNil: [ :nextLink | [ self dispatch: aMessage next: nextLink ] ].
	aMiddlewareLink value dispatch: aMessage nextBlock: nextBlock
]

{ #category : #initialization }
WCMessageBus >> initialize [

	super initialize.
	middlewares := LinkedList new.
]
