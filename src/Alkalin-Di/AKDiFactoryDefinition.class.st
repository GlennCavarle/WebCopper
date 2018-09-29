Class {
	#name : #AKDiFactoryDefinition,
	#superclass : #AKDiDefinition,
	#instVars : [
		'factoryBlock'
	],
	#category : #'Alkalin-Di-Definition'
}

{ #category : #evaluating }
AKDiFactoryDefinition >> createInstance: aServiceContainer [
	^ self factoryBlock cull: aServiceContainer
]

{ #category : #accessing }
AKDiFactoryDefinition >> factory: aBlock [
	self 
		assert: [ aBlock isBlock ]
		description:[ 'Argument must be a BlockClosure' ].
		
	factoryBlock := aBlock
]

{ #category : #accessing }
AKDiFactoryDefinition >> factoryBlock [
	^ factoryBlock ifNil: [ Error signal: 'factory block is mandatory in ' , self className ]
]
