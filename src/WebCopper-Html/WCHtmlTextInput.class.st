Class {
	#name : #WCHtmlTextInput,
	#superclass : #WCHtmlInput,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlTextInput >> accept: aVisitor [
	aVisitor visitTextInput: self 
]

{ #category : #initialization }
WCHtmlTextInput >> initialize [
	super initialize.
	self type: #text
]

{ #category : #'as yet unclassified' }
WCHtmlTextInput >> placeholder: aString [
	self attr: #placeholder value: aString 
]
