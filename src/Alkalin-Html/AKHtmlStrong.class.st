Class {
	#name : #AKHtmlStrong,
	#superclass : #AKHtmlContentElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlStrong >> accept: aVisitor [
	aVisitor visitStrong: self 
]

{ #category : #initialization }
AKHtmlStrong >> initialize [
	super initialize.
	self tag:#strong.
]
