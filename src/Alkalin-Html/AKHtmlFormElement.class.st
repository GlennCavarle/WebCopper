Class {
	#name : #AKHtmlFormElement,
	#superclass : #AKHtmlContentElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #'as yet unclassified' }
AKHtmlFormElement >> accept: aVisitor [
	aVisitor visitFormElement: self 
]
