Class {
	#name : #AKHtmlHeading,
	#superclass : #AKHtmlContentElement,
	#instVars : [
		'level'
	],
	#category : #'Alkalin-Html-Node'
}

{ #category : #accessing }
AKHtmlHeading class >> level: aNumber [
	^ self new
		level: aNumber;
		yourself
]

{ #category : #visiting }
AKHtmlHeading >> accept: aVisitor [
	aVisitor visitHeading: self 
]

{ #category : #initialization }
AKHtmlHeading >> initialize [
	super initialize.
]

{ #category : #accessing }
AKHtmlHeading >> level: anInteger [
	self tag: 'h' , anInteger asString
]
