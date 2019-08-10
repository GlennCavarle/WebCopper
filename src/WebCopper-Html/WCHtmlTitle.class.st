Class {
	#name : #WCHtmlTitle,
	#superclass : #WCHtmlElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlTitle >> accept: aVisitor [
	aVisitor visitTitle: self 
]

{ #category : #'as yet unclassified' }
WCHtmlTitle >> initialize [
	super initialize.
	self tag:#title
]
