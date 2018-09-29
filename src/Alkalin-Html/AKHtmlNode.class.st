Class {
	#name : #AKHtmlNode,
	#superclass : #Object,
	#traits : 'TAKAssertion',
	#classTraits : 'TAKAssertion classTrait',
	#classVars : [
		'builder'
	],
	#category : #'Alkalin-Html-Node'
}

{ #category : #asserting }
AKHtmlNode class >> assertionsEnabled [
	<return: #Boolean>
	^ AKGlobalSettings assertionsEnabled
]

{ #category : #'as yet unclassified' }
AKHtmlNode class >> builderClass [
	^ builder ifNil: [ builder := AKHtmlBuilder ]
]

{ #category : #'as yet unclassified' }
AKHtmlNode >> accept: aVisitor [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
AKHtmlNode >> builderClass [
	^ self class builderClass
]
