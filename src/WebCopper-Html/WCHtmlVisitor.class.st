Class {
	#name : #WCHtmlVisitor,
	#superclass : #Object,
	#category : #'WebCopper-Html-Renderer'
}

{ #category : #visiting }
WCHtmlVisitor >> visit: anElement [
	anElement accept: self
]

{ #category : #'visiting body' }
WCHtmlVisitor >> visitBody: anElement [
	self visitElement: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitButton:  anElement [
	self visitFormElement: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitButtonInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitCheckbox:  anElement [
	self visitInput: anElement
]

{ #category : #visiting }
WCHtmlVisitor >> visitContentElement: anElement [
	self visitElement: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitDateInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting body' }
WCHtmlVisitor >> visitDiv: anElement [
	self visitContentElement: anElement
]

{ #category : #visiting }
WCHtmlVisitor >> visitDoctype: anElement [
]

{ #category : #visiting }
WCHtmlVisitor >> visitDocument: anElement [
	anElement elements do: [:each| each accept: self ]
]

{ #category : #visiting }
WCHtmlVisitor >> visitElement: anElement [
]

{ #category : #visiting }
WCHtmlVisitor >> visitElementAttribute: anAttribute [
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitEmailInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitFileInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitForm: anElement [
	self visitContentElement: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitFormElement: anElement [
	self visitContentElement: anElement
]

{ #category : #'visiting head' }
WCHtmlVisitor >> visitHead: anElement [
	self visitElement: anElement
]

{ #category : #'visiting body' }
WCHtmlVisitor >> visitHeading: anElement [
	self visitContentElement: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitHiddenInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitImageInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting body' }
WCHtmlVisitor >> visitImg: anElement [
	self visitElement: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitInput:  anElement [
	self visitFormElement: anElement
]

{ #category : #'visiting head' }
WCHtmlVisitor >> visitLink: anElement [
	self visitElement: anElement
]

{ #category : #'visiting head' }
WCHtmlVisitor >> visitMeta: anElement [
	self visitElement: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitMonthInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitNumberInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitPasswordInput:  anElement [
	self visitInput: anElement
]

{ #category : #visiting }
WCHtmlVisitor >> visitRootHtml: anElement [
	self visitElement: anElement
]

{ #category : #'visiting body' }
WCHtmlVisitor >> visitScript: anElement [
	self visitElement: anElement
]

{ #category : #'visiting body' }
WCHtmlVisitor >> visitSpan: anElement [
	self visitContentElement: anElement
]

{ #category : #'visiting body' }
WCHtmlVisitor >> visitStrong: anElement [
	self visitContentElement: anElement
]

{ #category : #visiting }
WCHtmlVisitor >> visitTemplate: anElement [
	self visit: anElement document
]

{ #category : #'visiting body' }
WCHtmlVisitor >> visitText: anElement [
	
]

{ #category : #'visiting form' }
WCHtmlVisitor >> visitTextInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting head' }
WCHtmlVisitor >> visitTitle: anElement [
	self visitElement: anElement
]
