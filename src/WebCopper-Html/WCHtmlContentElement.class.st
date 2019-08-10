Class {
	#name : #WCHtmlContentElement,
	#superclass : #WCHtmlElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlContentElement >> accept: aVisitor [
	aVisitor visitContentElement: self 
]

{ #category : #builder }
WCHtmlContentElement >> button: aBlock [
	| object |
	object := self builderClass button.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
WCHtmlContentElement >> checkbox: aBlock [
	| object |
	object := self builderClass checkbox.
	self add: object.
	aBlock value: object
]

{ #category : #attributes }
WCHtmlContentElement >> classes: aString [
	self attr: #class value: aString 
]

{ #category : #builder }
WCHtmlContentElement >> div: aBlock [
	| object |
	object := self builderClass div.
	self add: object.
	aBlock value: object
]

{ #category : #'heading builder' }
WCHtmlContentElement >> h1: aBlock [
	self heading: 1 content: aBlock
]

{ #category : #'heading builder' }
WCHtmlContentElement >> h2: aBlock [
	self heading: 2 content: aBlock
]

{ #category : #'heading builder' }
WCHtmlContentElement >> h3: aBlock [
	self heading: 3 content: aBlock
]

{ #category : #'heading builder' }
WCHtmlContentElement >> h4: aBlock [
	self heading: 4 content: aBlock
]

{ #category : #'heading builder' }
WCHtmlContentElement >> h5: aBlock [
	self heading: 5 content: aBlock
]

{ #category : #'heading builder' }
WCHtmlContentElement >> h6: aBlock [
	self heading: 6 content: aBlock
]

{ #category : #'heading builder' }
WCHtmlContentElement >> heading: aNumber content:aBlock [
	| object |
	object := self builderClass heading: aNumber.
	self add: object.
	aBlock value: object
]

{ #category : #attributes }
WCHtmlContentElement >> id: aString [
	self attr: #id value: aString 
]

{ #category : #builder }
WCHtmlContentElement >> input: aBlock [
	| object |
	object := self builderClass input.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
WCHtmlContentElement >> span: aBlock [
	| object |
	object := self builderClass span.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
WCHtmlContentElement >> strong: aBlock [
	| object |
	object := self builderClass strong.
	self add: object.
	aBlock value: object
]

{ #category : #attributes }
WCHtmlContentElement >> style: aString [
	self attr: #style value: aString 
]

{ #category : #builder }
WCHtmlContentElement >> textInput: aBlock [
	| object |
	object := self builderClass textInput.
	self add: object.
	aBlock value: object
]
