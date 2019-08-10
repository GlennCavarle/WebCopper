Class {
	#name : #WCHtmlForm,
	#superclass : #WCHtmlContentElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlForm >> accept: aVisitor [
	aVisitor visitForm: self 
]

{ #category : #accessing }
WCHtmlForm >> action: aString [
	self attr: #action value: aString
]

{ #category : #initialization }
WCHtmlForm >> initialize [
	super initialize.
	self tag:#form.
]

{ #category : #accessing }
WCHtmlForm >> method: aString [
	self 
		assert:[#(#GET #POST) includes: aString]
		description:['HTML Form method can be only #GET or #POST'].
		
	self attr: #method value: aString 
]

{ #category : #accessing }
WCHtmlForm >> target: aString [
	self attr: #target value: aString
]
