Class {
	#name : #WCHtmlDiv,
	#superclass : #WCHtmlContentElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlDiv >> accept: aVisitor [
	aVisitor visitDiv: self 
]

{ #category : #'as yet unclassified' }
WCHtmlDiv >> initialize [
	super initialize.
	self tag:#div.
]
