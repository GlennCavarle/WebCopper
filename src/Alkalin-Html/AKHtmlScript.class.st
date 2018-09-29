Class {
	#name : #AKHtmlScript,
	#superclass : #AKHtmlElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlScript >> accept: aVisitor [
	aVisitor visitScript: self 
]

{ #category : #'as yet unclassified' }
AKHtmlScript >> async: aString [
	self attr: #async value: aString
]

{ #category : #'as yet unclassified' }
AKHtmlScript >> charset: aString [
	self attr: #charset value: aString
]

{ #category : #'as yet unclassified' }
AKHtmlScript >> defer: aString [
	self attr: #defer value: aString
]

{ #category : #'as yet unclassified' }
AKHtmlScript >> initialize [
	super initialize.
	self tag:#script.
]

{ #category : #'as yet unclassified' }
AKHtmlScript >> src: aString [
	self attr: #src value: aString
]

{ #category : #'as yet unclassified' }
AKHtmlScript >> type: aString [
	self attr: #type value: aString
]
