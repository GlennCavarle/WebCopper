Class {
	#name : #AKHtmlSpan,
	#superclass : #AKHtmlContentElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlSpan >> accept: aVisitor [
	aVisitor visitSpan: self 
]

{ #category : #'as yet unclassified' }
AKHtmlSpan >> initialize [
	super initialize.
	self tag:#span.
]
