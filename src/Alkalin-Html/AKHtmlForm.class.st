Class {
	#name : #AKHtmlForm,
	#superclass : #AKHtmlContentElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlForm >> accept: aVisitor [
	aVisitor visitForm: self 
]

{ #category : #accessing }
AKHtmlForm >> action: aString [
	self attr: #action value: aString
]

{ #category : #initialization }
AKHtmlForm >> initialize [
	super initialize.
	self tag:#form.
]

{ #category : #accessing }
AKHtmlForm >> method: aString [
	self 
		assert:[#(#GET #POST) includes: aString]
		description:['HTML Form method can be only #GET or #POST'].
		
	self attr: #method value: aString 
]

{ #category : #accessing }
AKHtmlForm >> target: aString [
	self attr: #target value: aString
]
