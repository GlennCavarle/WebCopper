Class {
	#name : #AKHtmlTextInput,
	#superclass : #AKHtmlInput,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlTextInput >> accept: aVisitor [
	aVisitor visitTextInput: self 
]

{ #category : #initialization }
AKHtmlTextInput >> initialize [
	super initialize.
	self type: #text
]

{ #category : #'as yet unclassified' }
AKHtmlTextInput >> placeholder: aString [
	self attr: #placeholder value: aString 
]
