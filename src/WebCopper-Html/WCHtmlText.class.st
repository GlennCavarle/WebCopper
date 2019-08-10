Class {
	#name : #WCHtmlText,
	#superclass : #WCHtmlElement,
	#instVars : [
		'text'
	],
	#category : #'WebCopper-Html-Node'
}

{ #category : #accessing }
WCHtmlText >> accept: aVisitor [
	aVisitor visitText: self 
]

{ #category : #accessing }
WCHtmlText >> text [
	^ text
]

{ #category : #accessing }
WCHtmlText >> text: anObject [
	text := anObject
]
