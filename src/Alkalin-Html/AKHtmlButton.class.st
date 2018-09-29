Class {
	#name : #AKHtmlButton,
	#superclass : #AKHtmlFormElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #'as yet unclassified' }
AKHtmlButton >> accept: aVisitor [
	aVisitor visitButton: self 
]

{ #category : #'as yet unclassified' }
AKHtmlButton >> initialize [
	super initialize.
	self tag:#button.
]
