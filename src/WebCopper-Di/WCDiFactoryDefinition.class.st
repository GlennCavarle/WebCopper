Class {
	#name : #WCDiFactoryDefinition,
	#superclass : #WCDiDefinition,
	#instVars : [
		'factoryBlock'
	],
	#category : #'WebCopper-Di-Definition'
}

{ #category : #evaluating }
WCDiFactoryDefinition >> createInstance: aServiceContainer [
	^ self factoryBlock cull: aServiceContainer
]

{ #category : #accessing }
WCDiFactoryDefinition >> factory: aBlock [
	self 
		assert: [ aBlock isBlock ]
		description:[ 'Argument must be a BlockClosure' ].
		
	factoryBlock := aBlock
]

{ #category : #accessing }
WCDiFactoryDefinition >> factoryBlock [
	^ factoryBlock ifNil: [ Error signal: 'factory block is mandatory in ' , self className ]
]
