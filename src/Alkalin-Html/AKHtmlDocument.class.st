Class {
	#name : #AKHtmlDocument,
	#superclass : #AKHtmlNode,
	#instVars : [
		'elements'
	],
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlDocument >> accept: aVisitor [
	aVisitor visitDocument: self 
]

{ #category : #'as yet unclassified' }
AKHtmlDocument >> add: anElement [
	self elements add: anElement
]

{ #category : #builder }
AKHtmlDocument >> doctype: aBlock [
	| object |
	object := self builderClass doctype.
	self add: object.
	aBlock value: object
]

{ #category : #accessing }
AKHtmlDocument >> elements [
	^ elements
]

{ #category : #accessing }
AKHtmlDocument >> elements: anObject [
	elements := anObject
]

{ #category : #builder }
AKHtmlDocument >> html: aBlock [
	| object |
	object := self builderClass root.
	self add: object.
	aBlock value: object
]

{ #category : #'as yet unclassified' }
AKHtmlDocument >> initialize [
	super initialize.
	elements := OrderedCollection new.
	
]
