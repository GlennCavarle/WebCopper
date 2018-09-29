Class {
	#name : #AKHtmlMeta,
	#superclass : #AKHtmlElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlMeta >> accept: aVisitor [
	aVisitor visitMeta: self 
]

{ #category : #'as yet unclassified' }
AKHtmlMeta >> charset: aString [
	self attr: #charset value: aString
]

{ #category : #'as yet unclassified' }
AKHtmlMeta >> content: aString [
	self attr: #content value: aString
]

{ #category : #'as yet unclassified' }
AKHtmlMeta >> httpEquiv: aString [
	self attr: #httpEquiv value: aString
]

{ #category : #'as yet unclassified' }
AKHtmlMeta >> initialize [
	super initialize.
	self tag:#meta.
	self selfClosing: true
]

{ #category : #'as yet unclassified' }
AKHtmlMeta >> name: aString [
	self attr: #name value: aString
]

{ #category : #'as yet unclassified' }
AKHtmlMeta >> scheme: aString [
	self attr: #scheme value: aString
]
