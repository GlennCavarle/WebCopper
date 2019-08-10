Class {
	#name : #WCDiDeclarativeDefinition,
	#superclass : #WCDiDefinition,
	#instVars : [
		'targetClass',
		'constructor',
		'properties',
		'methodCalls',
		'configurationBlock'
	],
	#category : #'WebCopper-Di-Definition'
}

{ #category : #'as yet unclassified' }
WCDiDeclarativeDefinition class >> defaultConstructor [
	^ WCDiMethodCall selector: #new
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> configurationBlock [
	^ configurationBlock ifNil: [ configurationBlock := [ :anObject |  ] ]
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> configure: aBlock [
	self 
		assert: [ aBlock isBlock ]
		description:[ 'Argument must be a BlockClosure' ].
		
	configurationBlock := aBlock
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> constructor [
	^ constructor ifNil:[constructor := self class defaultConstructor]
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> constructor: aSymbol [
	constructor := WCDiMethodCall selector: aSymbol
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> constructor: aSymbol withArgs: aCollection [
	constructor := WCDiMethodCall selector: aSymbol arguments: aCollection
]

{ #category : #evaluating }
WCDiDeclarativeDefinition >> createInstance: aServiceContainer [
	| inst |
	inst := self constructor 
			resolveArgumentsUsing: aServiceContainer;
			sendTo: self targetClass. 
		
	self methodCalls
		do: [ :methCall | 
			methCall resolveArgumentsUsing: aServiceContainer.
			methCall sendTo: inst ].
		
	self configurationBlock value: inst.
	^ inst
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> methodCall: aSymbol [
	self methodCalls add: (WCDiMethodCall selector: aSymbol)
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> methodCall: aSymbol withArgs: aCollection [
	self methodCalls add: (WCDiMethodCall selector: aSymbol arguments: aCollection)
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> methodCalls [
	^ methodCalls ifNil: [ methodCalls := OrderedCollection new ]
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> targetClass [
	^ targetClass ifNil: [ Error signal: 'Service targetClass is mandatory in ServiceDefinition' ]
]

{ #category : #accessing }
WCDiDeclarativeDefinition >> targetClass: aClass [
	self 
		assert: [ aClass isClass ]
		description:[ 'Argument must be a Class' ].
		
	targetClass := aClass
]
