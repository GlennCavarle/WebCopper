Class {
	#name : #AKHtmlHead,
	#superclass : #AKHtmlElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlHead >> accept: aVisitor [
	aVisitor visitHead: self 
]

{ #category : #'as yet unclassified' }
AKHtmlHead >> initialize [
	super initialize.
	self tag:#head.
]

{ #category : #builder }
AKHtmlHead >> link: aBlock [
	| object |
	object := self builderClass link.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
AKHtmlHead >> meta: aBlock [
	| object |
	object := self builderClass meta.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
AKHtmlHead >> script: aBlock [
	| object |
	object := self builderClass script.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
AKHtmlHead >> title: aBlock [
	| object |
	object := self builderClass title.
	self add: object.
	aBlock value: object
]
