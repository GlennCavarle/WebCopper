Class {
	#name : #AKHtmlCheckbox,
	#superclass : #AKHtmlInput,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlCheckbox >> accept: aVisitor [
	aVisitor visitCheckbox: self 
]

{ #category : #'as yet unclassified' }
AKHtmlCheckbox >> initialize [
	super initialize.
	self type: #checkbox
]
