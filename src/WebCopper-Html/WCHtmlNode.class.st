Class {
	#name : #WCHtmlNode,
	#superclass : #Object,
	#traits : 'TWCAssertion',
	#classTraits : 'TWCAssertion classTrait',
	#classVars : [
		'builder'
	],
	#category : #'WebCopper-Html-Node'
}

{ #category : #asserting }
WCHtmlNode class >> assertionsEnabled [
	<return: #Boolean>
	^ WCGlobalSettings assertionsEnabled
]

{ #category : #'as yet unclassified' }
WCHtmlNode class >> builderClass [
	^ builder ifNil: [ builder := WCHtmlBuilder ]
]

{ #category : #'as yet unclassified' }
WCHtmlNode >> accept: aVisitor [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
WCHtmlNode >> builderClass [
	^ self class builderClass
]
