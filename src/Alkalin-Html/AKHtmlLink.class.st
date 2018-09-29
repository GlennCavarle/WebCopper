Class {
	#name : #AKHtmlLink,
	#superclass : #AKHtmlElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlLink >> accept: aVisitor [
	aVisitor visitLink: self 
]

{ #category : #attributes }
AKHtmlLink >> charset: aString [
	self attr: #charset value: aString
]

{ #category : #attributes }
AKHtmlLink >> crossorigin: aString [
	self attr: #crossorigin value: aString
]

{ #category : #attributes }
AKHtmlLink >> href: aString [
	self attr: #href value: aString
]

{ #category : #attributes }
AKHtmlLink >> hreflang: aString [
	self attr: #hreflang value: aString
]

{ #category : #initialization }
AKHtmlLink >> initialize [
	super initialize.
	self tag:#link.
	self selfClosing: true
]

{ #category : #attributes }
AKHtmlLink >> media: aString [
	self attr: #media value: aString
]

{ #category : #attributes }
AKHtmlLink >> rel: aString [
	self attr: #rel value: aString
]

{ #category : #attributes }
AKHtmlLink >> rel: aRel href: aString [
	self
		rel: aRel;
		href: aString;
		yourself
]

{ #category : #attributes }
AKHtmlLink >> rev: aString [
	self attr: #rev value: aString
]

{ #category : #attributes }
AKHtmlLink >> sizes: aString [
	self attr: #sizes value: aString
]

{ #category : #attributes }
AKHtmlLink >> target: aString [
	self attr: #target value: aString
]

{ #category : #attributes }
AKHtmlLink >> type: aString [
	self attr: #type value: aString
]
