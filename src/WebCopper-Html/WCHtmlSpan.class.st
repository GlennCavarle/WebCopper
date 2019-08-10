Class {
	#name : #WCHtmlSpan,
	#superclass : #WCHtmlContentElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlSpan >> accept: aVisitor [
	aVisitor visitSpan: self 
]

{ #category : #'as yet unclassified' }
WCHtmlSpan >> initialize [
	super initialize.
	self tag:#span.
]
