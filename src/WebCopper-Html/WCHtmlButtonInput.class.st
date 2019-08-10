Class {
	#name : #WCHtmlButtonInput,
	#superclass : #WCHtmlInput,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlButtonInput >> accept: aVisitor [
	aVisitor visitButtonInput: self 
]

{ #category : #initialization }
WCHtmlButtonInput >> initialize [
	super initialize.
	self type: #button
]
