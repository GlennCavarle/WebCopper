Class {
	#name : #AKHtmlElement,
	#superclass : #AKHtmlNode,
	#instVars : [
		'tag',
		'attributes',
		'children',
		'selfClosing'
	],
	#category : #'Alkalin-Html-Node'
}

{ #category : #'as yet unclassified' }
AKHtmlElement >> accept: aVisitor [
	aVisitor visitElement: self 
]

{ #category : #'as yet unclassified' }
AKHtmlElement >> add: anElement [
	self children add: anElement
]

{ #category : #'as yet unclassified' }
AKHtmlElement >> attr: aName value: aValue [
	self attributes at: aName put: (AKHtmlElementAttribute named: aName value: aValue)
]

{ #category : #accessing }
AKHtmlElement >> attributes [
	^ attributes
]

{ #category : #accessing }
AKHtmlElement >> attributes: anObject [
	attributes := anObject
]

{ #category : #accessing }
AKHtmlElement >> children [
	^ children
]

{ #category : #accessing }
AKHtmlElement >> children: anObject [
	children := anObject
]

{ #category : #'as yet unclassified' }
AKHtmlElement >> initialize [
	super initialize.
	attributes := Dictionary new.
	children := OrderedCollection new.
	selfClosing := false
]

{ #category : #accessing }
AKHtmlElement >> selfClosing [
	^ selfClosing
]

{ #category : #accessing }
AKHtmlElement >> selfClosing: anObject [
	selfClosing := anObject
]

{ #category : #accessing }
AKHtmlElement >> tag [
	^ tag
]

{ #category : #accessing }
AKHtmlElement >> tag: anObject [
	tag := anObject
]

{ #category : #builder }
AKHtmlElement >> text: aString [
	| object |
	object := self builderClass text
		text: aString;
		yourself.
	self add: object
]
