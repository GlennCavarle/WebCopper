Class {
	#name : #WCHtmlElementAttribute,
	#superclass : #WCHtmlNode,
	#instVars : [
		'name',
		'value'
	],
	#category : #'WebCopper-Html-Node'
}

{ #category : #'instance creation' }
WCHtmlElementAttribute class >> named: aName [
	^ self named: aName value: nil
]

{ #category : #'as yet unclassified' }
WCHtmlElementAttribute class >> named: aName value: aValue [
	^ self new
		name: aName;
		value: aValue;
		yourself
]

{ #category : #visiting }
WCHtmlElementAttribute >> accept: aVisitor [
	aVisitor visitElementAttribute: self 
]

{ #category : #accessing }
WCHtmlElementAttribute >> name [
	^ name
]

{ #category : #accessing }
WCHtmlElementAttribute >> name: anObject [
	name := anObject
]

{ #category : #accessing }
WCHtmlElementAttribute >> value [
	^ value
]

{ #category : #accessing }
WCHtmlElementAttribute >> value: anObject [
	value := anObject
]
