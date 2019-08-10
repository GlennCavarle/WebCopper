Class {
	#name : #WCHtmlRootHtml,
	#superclass : #WCHtmlElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlRootHtml >> accept: aVisitor [
	aVisitor visitRootHtml: self 
]

{ #category : #builder }
WCHtmlRootHtml >> body: aBlock [
	| object |
	object := self builderClass body.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
WCHtmlRootHtml >> head: aBlock [
	| object |
	object := self builderClass head.
	self add: object.
	aBlock value: object
]

{ #category : #'as yet unclassified' }
WCHtmlRootHtml >> initialize [
	super initialize.
	self tag:#html.
]

{ #category : #'as yet unclassified' }
WCHtmlRootHtml >> lang: aString [
	self attr: #lang value: aString 
]
