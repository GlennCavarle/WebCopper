Class {
	#name : #AKHtmlInput,
	#superclass : #AKHtmlFormElement,
	#category : #'Alkalin-Html-Node'
}

{ #category : #visiting }
AKHtmlInput >> accept: aVisitor [
	self visitInput: aVisitor
]

{ #category : #attributes }
AKHtmlInput >> autofocus: aBoolean [
	self attr: #autofocus value: aBoolean
]

{ #category : #attributes }
AKHtmlInput >> beAutofocus [
	self autofocus: true
]

{ #category : #attributes }
AKHtmlInput >> beDisabled [
	self disabled: true
]

{ #category : #attributes }
AKHtmlInput >> beReadonly [
	self readonly: true
]

{ #category : #attributes }
AKHtmlInput >> beRequired [
	self required: true
]

{ #category : #attributes }
AKHtmlInput >> disabled: aBoolean [
	self attr: #disabled value: aBoolean
]

{ #category : #'as yet unclassified' }
AKHtmlInput >> initialize [
	super initialize.
	self tag:#input.
	self selfClosing: true
]

{ #category : #attributes }
AKHtmlInput >> pattern: aString [
	self attr: #pattern value: aString
]

{ #category : #attributes }
AKHtmlInput >> readonly: aBoolean [
	self attr: #readonly value: aBoolean
]

{ #category : #attributes }
AKHtmlInput >> required: aBoolean [
	self attr: #required value: aBoolean
]

{ #category : #attributes }
AKHtmlInput >> type: aString [
	self attr: #type value: aString 
]
