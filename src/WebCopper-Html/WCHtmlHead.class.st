Class {
	#name : #WCHtmlHead,
	#superclass : #WCHtmlElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlHead >> accept: aVisitor [
	aVisitor visitHead: self 
]

{ #category : #'as yet unclassified' }
WCHtmlHead >> initialize [
	super initialize.
	self tag:#head.
]

{ #category : #builder }
WCHtmlHead >> link: aBlock [
	| object |
	object := self builderClass link.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
WCHtmlHead >> meta: aBlock [
	| object |
	object := self builderClass meta.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
WCHtmlHead >> script: aBlock [
	| object |
	object := self builderClass script.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
WCHtmlHead >> title: aBlock [
	| object |
	object := self builderClass title.
	self add: object.
	aBlock value: object
]
