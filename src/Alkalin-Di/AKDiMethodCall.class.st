Class {
	#name : #AKDiMethodCall,
	#superclass : #Object,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Alkalin-Di-Definition'
}

{ #category : #'instance creation' }
AKDiMethodCall class >> new [
	^ self shouldNotImplement
]

{ #category : #'instance creation' }
AKDiMethodCall class >> selector: aSelector [
	^ super new selector: aSelector asSymbol asUnary arguments: #()
]

{ #category : #'instance creation' }
AKDiMethodCall class >> selector: aSelector arguments: aCollection [
	^ super new selector: aSelector asSymbol asMutator arguments: aCollection
]

{ #category : #accessing }
AKDiMethodCall >> arguments [
	^ arguments
]

{ #category : #'as yet unclassified' }
AKDiMethodCall >> resolveArgumentsUsing: aServiceContainer [
	arguments := arguments collect: [ :each | each asAKRef resolveUsing: aServiceContainer ]
]

{ #category : #accessing }
AKDiMethodCall >> selector [
	^ selector
]

{ #category : #accessing }
AKDiMethodCall >> selector: aSelector arguments: aCollection [
	selector := aSelector.
	arguments := aCollection
]

{ #category : #sending }
AKDiMethodCall >> sendTo: anObject [
	^ anObject perform: self selector withEnoughArguments: self arguments
]
