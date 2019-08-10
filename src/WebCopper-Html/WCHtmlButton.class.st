Class {
	#name : #WCHtmlButton,
	#superclass : #WCHtmlFormElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #'as yet unclassified' }
WCHtmlButton >> accept: aVisitor [
	aVisitor visitButton: self 
]

{ #category : #'as yet unclassified' }
WCHtmlButton >> initialize [
	super initialize.
	self tag:#button.
]
