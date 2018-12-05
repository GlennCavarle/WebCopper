Class {
	#name : #AKDiContainer,
	#superclass : #Object,
	#traits : 'TAKAssertion',
	#classTraits : 'TAKAssertion classTrait',
	#instVars : [
		'services'
	],
	#category : #'Alkalin-Di-Container'
}

{ #category : #asserting }
AKDiContainer class >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with AKGlobalSettings enableAssertions"
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #asserting }
AKDiContainer class >> assertionsEnabled [
	<return: #Boolean>
	^ AKGlobalSettings assertionsEnabled
]

{ #category : #public }
AKDiContainer >> addDefinition: aBlock [
	| aDef |
	aDef := AKDiDeclarativeDefinition new.
	aBlock value: aDef.
	
	self addServiceFromDefinition: aDef 
	
]

{ #category : #private }
AKDiContainer >> addServiceFromDefinition: aDef [

	aDef identifier = #ServiceContainer
		ifTrue: [ AKDiReservedServiceKey signalForKey: aDef identifier ].
		
	services at: aDef identifier put: (AKDiService definition: aDef)
]

{ #category : #private }
AKDiContainer >> clear [
	services removeAll.
]

{ #category : #public }
AKDiContainer >> get: aServiceKey [

	self 
		assert: [ aServiceKey isSymbol ]
		description:[ 'Argument must be a Symbol' ].
	
	aServiceKey = #ServiceContainer ifTrue:[^ self].
	
	services at: aServiceKey 
		ifPresent: [:svc | ^ svc getOrCreateInstanceUsing: self]
		ifAbsent: [ AKDiServiceNotFound signalForKey: aServiceKey ].
		
]

{ #category : #public }
AKDiContainer >> has: aServiceKey [

	self 
		assert: [ aServiceKey isSymbol ]
		description:[ 'Argument must be a Symbol' ].
	
	^ aServiceKey = #ServiceContainer or:[services includesKey: aServiceKey].
	
		
]

{ #category : #initialization }
AKDiContainer >> initialize [
	super initialize.
	services := Dictionary new
]

{ #category : #public }
AKDiContainer >> registerClass: aClass as: aKey [
	
	self addDefinition: [ :def | def
				identifier: aKey;
				targetClass: aClass ].

]

{ #category : #public }
AKDiContainer >> registerFactory: aBlock as: aKey [
	| aDef |
	aDef := AKDiFactoryDefinition new.
	aDef
		identifier: aKey;
		factory: aBlock.
	self addServiceFromDefinition: aDef
]

{ #category : #private }
AKDiContainer >> servicesWithTag: aTagName [
	^ services select: [ :svc | svc definition tags includesKey: aTagName ]
]

{ #category : #private }
AKDiContainer >> servicesWithTag: aTagName do: aBlock [
	(self servicesWithTag: aTagName)
		do: [ :each | aBlock 
			value: (each getOrCreateInstanceUsing: self)
			value: (each definition tags at: aTagName) ]
]
