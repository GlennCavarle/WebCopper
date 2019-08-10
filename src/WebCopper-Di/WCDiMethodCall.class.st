Class {
	#name : #WCDiMethodCall,
	#superclass : #Object,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'WebCopper-Di-Definition'
}

{ #category : #'instance creation' }
WCDiMethodCall class >> new [
	^ self shouldNotImplement
]

{ #category : #'instance creation' }
WCDiMethodCall class >> selector: aSelector [
	^ super new selector: aSelector asSymbol asUnary arguments: #()
]

{ #category : #'instance creation' }
WCDiMethodCall class >> selector: aSelector arguments: aCollection [
	^ super new selector: aSelector asSymbol asMutator arguments: aCollection
]

{ #category : #accessing }
WCDiMethodCall >> arguments [
	^ arguments
]

{ #category : #'as yet unclassified' }
WCDiMethodCall >> resolveArgumentsUsing: aServiceContainer [
	arguments := arguments collect: [ :each | each asWCRef resolveUsing: aServiceContainer ]
]

{ #category : #accessing }
WCDiMethodCall >> selector [
	^ selector
]

{ #category : #accessing }
WCDiMethodCall >> selector: aSelector arguments: aCollection [
	selector := aSelector.
	arguments := aCollection
]

{ #category : #sending }
WCDiMethodCall >> sendTo: anObject [
	^ anObject perform: self selector withEnoughArguments: self arguments
]
