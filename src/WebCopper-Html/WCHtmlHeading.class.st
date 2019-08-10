Class {
	#name : #WCHtmlHeading,
	#superclass : #WCHtmlContentElement,
	#instVars : [
		'level'
	],
	#category : #'WebCopper-Html-Node'
}

{ #category : #accessing }
WCHtmlHeading class >> level: aNumber [
	^ self new
		level: aNumber;
		yourself
]

{ #category : #visiting }
WCHtmlHeading >> accept: aVisitor [
	aVisitor visitHeading: self 
]

{ #category : #initialization }
WCHtmlHeading >> initialize [
	super initialize.
]

{ #category : #accessing }
WCHtmlHeading >> level: anInteger [
	self tag: 'h' , anInteger asString
]
