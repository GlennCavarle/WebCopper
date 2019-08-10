Class {
	#name : #WCHtmlElement,
	#superclass : #WCHtmlNode,
	#instVars : [
		'tag',
		'attributes',
		'children',
		'selfClosing'
	],
	#category : #'WebCopper-Html-Node'
}

{ #category : #'as yet unclassified' }
WCHtmlElement >> accept: aVisitor [
	aVisitor visitElement: self 
]

{ #category : #'as yet unclassified' }
WCHtmlElement >> add: anElement [
	self children add: anElement
]

{ #category : #'as yet unclassified' }
WCHtmlElement >> attr: aName value: aValue [
	self attributes at: aName put: (WCHtmlElementAttribute named: aName value: aValue)
]

{ #category : #accessing }
WCHtmlElement >> attributes [
	^ attributes
]

{ #category : #accessing }
WCHtmlElement >> attributes: anObject [
	attributes := anObject
]

{ #category : #accessing }
WCHtmlElement >> children [
	^ children
]

{ #category : #accessing }
WCHtmlElement >> children: anObject [
	children := anObject
]

{ #category : #'as yet unclassified' }
WCHtmlElement >> initialize [
	super initialize.
	attributes := Dictionary new.
	children := OrderedCollection new.
	selfClosing := false
]

{ #category : #accessing }
WCHtmlElement >> selfClosing [
	^ selfClosing
]

{ #category : #accessing }
WCHtmlElement >> selfClosing: anObject [
	selfClosing := anObject
]

{ #category : #accessing }
WCHtmlElement >> tag [
	^ tag
]

{ #category : #accessing }
WCHtmlElement >> tag: anObject [
	tag := anObject
]

{ #category : #builder }
WCHtmlElement >> text: aString [
	| object |
	object := self builderClass text
		text: aString;
		yourself.
	self add: object
]
