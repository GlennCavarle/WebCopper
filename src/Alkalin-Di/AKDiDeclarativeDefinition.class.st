Class {
	#name : #AKDiDeclarativeDefinition,
	#superclass : #AKDiDefinition,
	#instVars : [
		'targetClass',
		'constructor',
		'properties',
		'methodCalls',
		'configurationBlock'
	],
	#category : #'Alkalin-Di-Definition'
}

{ #category : #'as yet unclassified' }
AKDiDeclarativeDefinition class >> defaultConstructor [
	^ AKDiMethodCall selector: #new
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> configurationBlock [
	^ configurationBlock ifNil: [ configurationBlock := [ :anObject |  ] ]
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> configure: aBlock [
	self 
		assert: [ aBlock isBlock ]
		description:[ 'Argument must be a BlockClosure' ].
		
	configurationBlock := aBlock
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> constructor [
	^ constructor ifNil:[constructor := self class defaultConstructor]
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> constructor: aSymbol [
	constructor := AKDiMethodCall selector: aSymbol
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> constructor: aSymbol withArgs: aCollection [
	constructor := AKDiMethodCall selector: aSymbol arguments: aCollection
]

{ #category : #evaluating }
AKDiDeclarativeDefinition >> createInstance: aServiceContainer [
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
AKDiDeclarativeDefinition >> methodCall: aSymbol [
	self methodCalls add: (AKDiMethodCall selector: aSymbol)
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> methodCall: aSymbol withArgs: aCollection [
	self methodCalls add: (AKDiMethodCall selector: aSymbol arguments: aCollection)
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> methodCalls [
	^ methodCalls ifNil: [ methodCalls := OrderedCollection new ]
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> targetClass [
	^ targetClass ifNil: [ Error signal: 'Service targetClass is mandatory in ServiceDefinition' ]
]

{ #category : #accessing }
AKDiDeclarativeDefinition >> targetClass: aClass [
	self 
		assert: [ aClass isClass ]
		description:[ 'Argument must be a Class' ].
		
	targetClass := aClass
]
