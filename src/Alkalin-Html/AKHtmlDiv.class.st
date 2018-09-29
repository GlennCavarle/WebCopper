Class {
	#name : #AKHtmlDiv,
	#superclass : #AKHtmlContentElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlDiv >> accept: aVisitor [
	aVisitor visitDiv: self 
]

{ #category : #'as yet unclassified' }
AKHtmlDiv >> initialize [
	super initialize.
	self tag:#div.
]
