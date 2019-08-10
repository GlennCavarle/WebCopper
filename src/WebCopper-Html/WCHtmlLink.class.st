Class {
	#name : #WCHtmlLink,
	#superclass : #WCHtmlElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlLink >> accept: aVisitor [
	aVisitor visitLink: self 
]

{ #category : #attributes }
WCHtmlLink >> charset: aString [
	self attr: #charset value: aString
]

{ #category : #attributes }
WCHtmlLink >> crossorigin: aString [
	self attr: #crossorigin value: aString
]

{ #category : #attributes }
WCHtmlLink >> href: aString [
	self attr: #href value: aString
]

{ #category : #attributes }
WCHtmlLink >> hreflang: aString [
	self attr: #hreflang value: aString
]

{ #category : #initialization }
WCHtmlLink >> initialize [
	super initialize.
	self tag:#link.
	self selfClosing: true
]

{ #category : #attributes }
WCHtmlLink >> media: aString [
	self attr: #media value: aString
]

{ #category : #attributes }
WCHtmlLink >> rel: aString [
	self attr: #rel value: aString
]

{ #category : #attributes }
WCHtmlLink >> rel: aRel href: aString [
	self
		rel: aRel;
		href: aString;
		yourself
]

{ #category : #attributes }
WCHtmlLink >> rev: aString [
	self attr: #rev value: aString
]

{ #category : #attributes }
WCHtmlLink >> sizes: aString [
	self attr: #sizes value: aString
]

{ #category : #attributes }
WCHtmlLink >> target: aString [
	self attr: #target value: aString
]

{ #category : #attributes }
WCHtmlLink >> type: aString [
	self attr: #type value: aString
]
