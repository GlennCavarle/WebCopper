Class {
	#name : #WCHtmlImg,
	#superclass : #WCHtmlElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlImg >> accept: aVisitor [
	aVisitor visitImg: self 
]

{ #category : #'as yet unclassified' }
WCHtmlImg >> initialize [
	super initialize.
	self tag: #img.
	self selfClosing: true
]

{ #category : #'as yet unclassified' }
WCHtmlImg >> src: aString [
	self attr: #src value: aString
]
