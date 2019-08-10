Class {
	#name : #WCDiContainer,
	#superclass : #Object,
	#traits : 'TWCAssertion',
	#classTraits : 'TWCAssertion classTrait',
	#instVars : [
		'services'
	],
	#category : #'WebCopper-Di-Container'
}

{ #category : #asserting }
WCDiContainer class >> assert: aBlock [
	"Throw an assertion error if aBlock does not evaluates to true.
	We check for true explicitly to make the assertion fail for non booleans.
	
	Note: Should be enabled with AKGlobalSettings enableAssertions"
	
	self assertionsEnabled
		ifTrue: [ aBlock value == true ifFalse: [ AssertionFailure signal: 'Assertion failed' ] ]
]

{ #category : #asserting }
WCDiContainer class >> assertionsEnabled [
	<return: #Boolean>
	^ WCGlobalSettings assertionsEnabled
]

{ #category : #public }
WCDiContainer >> addDefinition: aBlock [
	| aDef |
	aDef := WCDiDeclarativeDefinition new.
	aBlock value: aDef.
	
	self addServiceFromDefinition: aDef 
	
]

{ #category : #private }
WCDiContainer >> addServiceFromDefinition: aDef [

	aDef identifier = #ServiceContainer
		ifTrue: [ WCDiReservedServiceKey signalForKey: aDef identifier ].
		
	services at: aDef identifier put: (WCDiService definition: aDef)
]

{ #category : #private }
WCDiContainer >> clear [
	services removeAll.
]

{ #category : #public }
WCDiContainer >> get: aServiceKey [

	self 
		assert: [ aServiceKey isSymbol ]
		description:[ 'Argument must be a Symbol' ].
	
	aServiceKey = #ServiceContainer ifTrue:[^ self].
	
	services at: aServiceKey 
		ifPresent: [:svc | ^ svc getOrCreateInstanceUsing: self]
		ifAbsent: [ WCDiServiceNotFound signalForKey: aServiceKey ].
		
]

{ #category : #public }
WCDiContainer >> has: aServiceKey [

	self 
		assert: [ aServiceKey isSymbol ]
		description:[ 'Argument must be a Symbol' ].
	
	^ aServiceKey = #ServiceContainer or:[services includesKey: aServiceKey].
	
		
]

{ #category : #initialization }
WCDiContainer >> initialize [
	super initialize.
	services := Dictionary new
]

{ #category : #public }
WCDiContainer >> registerClass: aClass as: aKey [
	
	self addDefinition: [ :def | def
				identifier: aKey;
				targetClass: aClass ].

]

{ #category : #public }
WCDiContainer >> registerFactory: aBlock as: aKey [
	| aDef |
	aDef := WCDiFactoryDefinition new.
	aDef
		identifier: aKey;
		factory: aBlock.
	self addServiceFromDefinition: aDef
]

{ #category : #private }
WCDiContainer >> servicesWithTag: aTagName [
	^ services select: [ :svc | svc definition tags includesKey: aTagName ]
]

{ #category : #private }
WCDiContainer >> servicesWithTag: aTagName do: aBlock [
	(self servicesWithTag: aTagName)
		do: [ :each | aBlock 
			value: (each getOrCreateInstanceUsing: self)
			value: (each definition tags at: aTagName) ]
]
