Class {
	#name : #AKHtmlBody,
	#superclass : #AKHtmlContentElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlBody >> accept: aVisitor [
	aVisitor visitBody: self 
]

{ #category : #'as yet unclassified' }
AKHtmlBody >> initialize [
	super initialize.
	self tag:#body.
]
