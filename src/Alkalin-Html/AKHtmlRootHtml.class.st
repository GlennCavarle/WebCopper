Class {
	#name : #AKHtmlRootHtml,
	#superclass : #AKHtmlElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlRootHtml >> accept: aVisitor [
	aVisitor visitRootHtml: self 
]

{ #category : #builder }
AKHtmlRootHtml >> body: aBlock [
	| object |
	object := self builderClass body.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
AKHtmlRootHtml >> head: aBlock [
	| object |
	object := self builderClass head.
	self add: object.
	aBlock value: object
]

{ #category : #'as yet unclassified' }
AKHtmlRootHtml >> initialize [
	super initialize.
	self tag:#html.
]

{ #category : #'as yet unclassified' }
AKHtmlRootHtml >> lang: aString [
	self attr: #lang value: aString 
]
