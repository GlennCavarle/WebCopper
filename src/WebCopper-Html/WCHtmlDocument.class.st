Class {
	#name : #WCHtmlDocument,
	#superclass : #WCHtmlNode,
	#instVars : [
		'elements'
	],
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlDocument >> accept: aVisitor [
	aVisitor visitDocument: self 
]

{ #category : #'as yet unclassified' }
WCHtmlDocument >> add: anElement [
	self elements add: anElement
]

{ #category : #builder }
WCHtmlDocument >> doctype: aBlock [
	| object |
	object := self builderClass doctype.
	self add: object.
	aBlock value: object
]

{ #category : #accessing }
WCHtmlDocument >> elements [
	^ elements
]

{ #category : #accessing }
WCHtmlDocument >> elements: anObject [
	elements := anObject
]

{ #category : #builder }
WCHtmlDocument >> html: aBlock [
	| object |
	object := self builderClass root.
	self add: object.
	aBlock value: object
]

{ #category : #'as yet unclassified' }
WCHtmlDocument >> initialize [
	super initialize.
	elements := OrderedCollection new.
	
]
