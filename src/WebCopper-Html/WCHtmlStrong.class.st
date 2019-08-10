Class {
	#name : #WCHtmlStrong,
	#superclass : #WCHtmlContentElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlStrong >> accept: aVisitor [
	aVisitor visitStrong: self 
]

{ #category : #initialization }
WCHtmlStrong >> initialize [
	super initialize.
	self tag:#strong.
]
