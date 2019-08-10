Class {
	#name : #WCHtmlScript,
	#superclass : #WCHtmlElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlScript >> accept: aVisitor [
	aVisitor visitScript: self 
]

{ #category : #'as yet unclassified' }
WCHtmlScript >> async: aString [
	self attr: #async value: aString
]

{ #category : #'as yet unclassified' }
WCHtmlScript >> charset: aString [
	self attr: #charset value: aString
]

{ #category : #'as yet unclassified' }
WCHtmlScript >> defer: aString [
	self attr: #defer value: aString
]

{ #category : #'as yet unclassified' }
WCHtmlScript >> initialize [
	super initialize.
	self tag:#script.
]

{ #category : #'as yet unclassified' }
WCHtmlScript >> src: aString [
	self attr: #src value: aString
]

{ #category : #'as yet unclassified' }
WCHtmlScript >> type: aString [
	self attr: #type value: aString
]
