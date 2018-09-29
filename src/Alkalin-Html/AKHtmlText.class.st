Class {
	#name : #AKHtmlText,
	#superclass : #AKHtmlElement,
	#instVars : [
		'text'
	],
	#category : #'Alkalin-Html-Node'
}

{ #category : #accessing }
AKHtmlText >> accept: aVisitor [
	aVisitor visitText: self 
]

{ #category : #accessing }
AKHtmlText >> text [
	^ text
]

{ #category : #accessing }
AKHtmlText >> text: anObject [
	text := anObject
]
