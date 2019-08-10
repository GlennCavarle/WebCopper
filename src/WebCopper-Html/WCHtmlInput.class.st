Class {
	#name : #WCHtmlInput,
	#superclass : #WCHtmlFormElement,
	#category : #'WebCopper-Html-Node'
}

{ #category : #visiting }
WCHtmlInput >> accept: aVisitor [
	self visitInput: aVisitor
]

{ #category : #attributes }
WCHtmlInput >> autofocus: aBoolean [
	self attr: #autofocus value: aBoolean
]

{ #category : #attributes }
WCHtmlInput >> beAutofocus [
	self autofocus: true
]

{ #category : #attributes }
WCHtmlInput >> beDisabled [
	self disabled: true
]

{ #category : #attributes }
WCHtmlInput >> beReadonly [
	self readonly: true
]

{ #category : #attributes }
WCHtmlInput >> beRequired [
	self required: true
]

{ #category : #attributes }
WCHtmlInput >> disabled: aBoolean [
	self attr: #disabled value: aBoolean
]

{ #category : #'as yet unclassified' }
WCHtmlInput >> initialize [
	super initialize.
	self tag:#input.
	self selfClosing: true
]

{ #category : #attributes }
WCHtmlInput >> pattern: aString [
	self attr: #pattern value: aString
]

{ #category : #attributes }
WCHtmlInput >> readonly: aBoolean [
	self attr: #readonly value: aBoolean
]

{ #category : #attributes }
WCHtmlInput >> required: aBoolean [
	self attr: #required value: aBoolean
]

{ #category : #attributes }
WCHtmlInput >> type: aString [
	self attr: #type value: aString 
]
