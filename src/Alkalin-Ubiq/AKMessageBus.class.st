Class {
	#name : #AKMessageBus,
	#superclass : #Object,
	#instVars : [
		'middlewares'
	],
	#category : #'Alkalin-Ubiq-Message'
}

{ #category : #accessing }
AKMessageBus >> addMiddleware: aMiddleware [
	middlewares add: aMiddleware
]

{ #category : #accessing }
AKMessageBus >> clear [
	middlewares removeAll
]

{ #category : #dispatching }
AKMessageBus >> dispatch: aMessage [
	middlewares ifEmpty: [ ^ self ].
	self dispatch: aMessage next: middlewares firstLink
]

{ #category : #dispatching }
AKMessageBus >> dispatch: aMessage next: aMiddlewareLink [
	| nextBlock |
	nextBlock := aMiddlewareLink nextLink
		ifNil: [ [  ] ]
		ifNotNil: [ :nextLink | [ self dispatch: aMessage next: nextLink ] ].
	aMiddlewareLink value dispatch: aMessage nextBlock: nextBlock
]

{ #category : #initialization }
AKMessageBus >> initialize [

	super initialize.
	middlewares := LinkedList new.
]
