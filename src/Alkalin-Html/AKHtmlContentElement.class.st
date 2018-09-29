Class {
	#name : #AKHtmlContentElement,
	#superclass : #AKHtmlElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlContentElement >> accept: aVisitor [
	aVisitor visitContentElement: self 
]

{ #category : #builder }
AKHtmlContentElement >> button: aBlock [
	| object |
	object := self builderClass button.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
AKHtmlContentElement >> checkbox: aBlock [
	| object |
	object := self builderClass checkbox.
	self add: object.
	aBlock value: object
]

{ #category : #attributes }
AKHtmlContentElement >> classes: aString [
	self attr: #class value: aString 
]

{ #category : #builder }
AKHtmlContentElement >> div: aBlock [
	| object |
	object := self builderClass div.
	self add: object.
	aBlock value: object
]

{ #category : #'heading builder' }
AKHtmlContentElement >> h1: aBlock [
	self heading: 1 content: aBlock
]

{ #category : #'heading builder' }
AKHtmlContentElement >> h2: aBlock [
	self heading: 2 content: aBlock
]

{ #category : #'heading builder' }
AKHtmlContentElement >> h3: aBlock [
	self heading: 3 content: aBlock
]

{ #category : #'heading builder' }
AKHtmlContentElement >> h4: aBlock [
	self heading: 4 content: aBlock
]

{ #category : #'heading builder' }
AKHtmlContentElement >> h5: aBlock [
	self heading: 5 content: aBlock
]

{ #category : #'heading builder' }
AKHtmlContentElement >> h6: aBlock [
	self heading: 6 content: aBlock
]

{ #category : #'heading builder' }
AKHtmlContentElement >> heading: aNumber content:aBlock [
	| object |
	object := self builderClass heading: aNumber.
	self add: object.
	aBlock value: object
]

{ #category : #attributes }
AKHtmlContentElement >> id: aString [
	self attr: #id value: aString 
]

{ #category : #builder }
AKHtmlContentElement >> input: aBlock [
	| object |
	object := self builderClass input.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
AKHtmlContentElement >> span: aBlock [
	| object |
	object := self builderClass span.
	self add: object.
	aBlock value: object
]

{ #category : #builder }
AKHtmlContentElement >> strong: aBlock [
	| object |
	object := self builderClass strong.
	self add: object.
	aBlock value: object
]

{ #category : #attributes }
AKHtmlContentElement >> style: aString [
	self attr: #style value: aString 
]

{ #category : #builder }
AKHtmlContentElement >> textInput: aBlock [
	| object |
	object := self builderClass textInput.
	self add: object.
	aBlock value: object
]
