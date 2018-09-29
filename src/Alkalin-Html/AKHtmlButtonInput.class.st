Class {
	#name : #AKHtmlButtonInput,
	#superclass : #AKHtmlInput,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlButtonInput >> accept: aVisitor [
	aVisitor visitButtonInput: self 
]

{ #category : #initialization }
AKHtmlButtonInput >> initialize [
	super initialize.
	self type: #button
]
