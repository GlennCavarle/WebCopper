Class {
	#name : #AKHtmlImg,
	#superclass : #AKHtmlElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlImg >> accept: aVisitor [
	aVisitor visitImg: self 
]

{ #category : #'as yet unclassified' }
AKHtmlImg >> initialize [
	super initialize.
	self tag: #img.
	self selfClosing: true
]

{ #category : #'as yet unclassified' }
AKHtmlImg >> src: aString [
	self attr: #src value: aString
]
