Class {
	#name : #AKHtmlDoctype,
	#superclass : #AKHtmlNode,
	#instVars : [
		'instruction'
	],
	#category : #'Alkalin-Html-Node'
}

{ #category : #accessing }
AKHtmlDoctype >> accept: aVisitor [
	aVisitor visitDoctype: self 
]

{ #category : #'as yet unclassified' }
AKHtmlDoctype >> beHTML5 [
	self instruction: 'doctype html'
]

{ #category : #accessing }
AKHtmlDoctype >> instruction [
	^ instruction
]

{ #category : #accessing }
AKHtmlDoctype >> instruction: anObject [
	instruction := anObject
]
