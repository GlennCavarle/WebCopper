Class {
	#name : #AKHtmlTitle,
	#superclass : #AKHtmlElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlTitle >> accept: aVisitor [
	aVisitor visitTitle: self 
]

{ #category : #'as yet unclassified' }
AKHtmlTitle >> initialize [
	super initialize.
	self tag:#title
]
