Class {
	#name : #WCHtmlBody,
	#superclass : #WCHtmlContentElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlBody >> accept: aVisitor [
	aVisitor visitBody: self 
]

{ #category : #'as yet unclassified' }
WCHtmlBody >> initialize [
	super initialize.
	self tag:#body.
]
