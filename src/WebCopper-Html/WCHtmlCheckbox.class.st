Class {
	#name : #WCHtmlCheckbox,
	#superclass : #WCHtmlInput,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlCheckbox >> accept: aVisitor [
	aVisitor visitCheckbox: self 
]

{ #category : #'as yet unclassified' }
WCHtmlCheckbox >> initialize [
	super initialize.
	self type: #checkbox
]
