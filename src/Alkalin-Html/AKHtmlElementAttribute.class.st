Class {
	#name : #AKHtmlElementAttribute,
	#superclass : #AKHtmlNode,
	#instVars : [
		'name',
		'value'
	],
	#category : #'Alkalin-Html-Node'
}

{ #category : #'instance creation' }
AKHtmlElementAttribute class >> named: aName [
	^ self named: aName value: nil
]

{ #category : #'as yet unclassified' }
AKHtmlElementAttribute class >> named: aName value: aValue [
	^ self new
		name: aName;
		value: aValue;
		yourself
]

{ #category : #visiting }
AKHtmlElementAttribute >> accept: aVisitor [
	aVisitor visitElementAttribute: self 
]

{ #category : #accessing }
AKHtmlElementAttribute >> name [
	^ name
]

{ #category : #accessing }
AKHtmlElementAttribute >> name: anObject [
	name := anObject
]

{ #category : #accessing }
AKHtmlElementAttribute >> value [
	^ value
]

{ #category : #accessing }
AKHtmlElementAttribute >> value: anObject [
	value := anObject
]
