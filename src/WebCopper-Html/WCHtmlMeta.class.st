Class {
	#name : #WCHtmlMeta,
	#superclass : #WCHtmlElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlMeta >> accept: aVisitor [
	aVisitor visitMeta: self 
]

{ #category : #'as yet unclassified' }
WCHtmlMeta >> charset: aString [
	self attr: #charset value: aString
]

{ #category : #'as yet unclassified' }
WCHtmlMeta >> content: aString [
	self attr: #content value: aString
]

{ #category : #'as yet unclassified' }
WCHtmlMeta >> httpEquiv: aString [
	self attr: #httpEquiv value: aString
]

{ #category : #'as yet unclassified' }
WCHtmlMeta >> initialize [
	super initialize.
	self tag:#meta.
	self selfClosing: true
]

{ #category : #'as yet unclassified' }
WCHtmlMeta >> name: aString [
	self attr: #name value: aString
]

{ #category : #'as yet unclassified' }
WCHtmlMeta >> scheme: aString [
	self attr: #scheme value: aString
]
