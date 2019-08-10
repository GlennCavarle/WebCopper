Class {
	#name : #WCHtmlFormElement,
	#superclass : #WCHtmlContentElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #'as yet unclassified' }
WCHtmlFormElement >> accept: aVisitor [
	aVisitor visitFormElement: self 
]
