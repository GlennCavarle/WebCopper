Class {
	#name : #WCHtmlDoctype,
	#superclass : #WCHtmlNode,
	#instVars : [
		'instruction'
	],
	#category : #'WebCopper-Html-Node'
}

{ #category : #accessing }
WCHtmlDoctype >> accept: aVisitor [
	aVisitor visitDoctype: self 
]

{ #category : #'as yet unclassified' }
WCHtmlDoctype >> beHTML5 [
	self instruction: 'doctype html'
]

{ #category : #accessing }
WCHtmlDoctype >> instruction [
	^ instruction
]

{ #category : #accessing }
WCHtmlDoctype >> instruction: anObject [
	instruction := anObject
]
