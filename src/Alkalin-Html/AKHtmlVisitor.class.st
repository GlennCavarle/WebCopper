Class {
	#name : #AKHtmlVisitor,
	#superclass : #Object,
	#category : #'Alkalin-Html-Renderer'
}

{ #category : #visiting }
AKHtmlVisitor >> visit: anElement [
	anElement accept: self
]

{ #category : #'visiting body' }
AKHtmlVisitor >> visitBody: anElement [
	self visitElement: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitButton:  anElement [
	self visitFormElement: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitButtonInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitCheckbox:  anElement [
	self visitInput: anElement
]

{ #category : #visiting }
AKHtmlVisitor >> visitContentElement: anElement [
	self visitElement: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitDateInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting body' }
AKHtmlVisitor >> visitDiv: anElement [
	self visitContentElement: anElement
]

{ #category : #visiting }
AKHtmlVisitor >> visitDoctype: anElement [
]

{ #category : #visiting }
AKHtmlVisitor >> visitDocument: anElement [
	anElement elements do: [:each| each accept: self ]
]

{ #category : #visiting }
AKHtmlVisitor >> visitElement: anElement [
]

{ #category : #visiting }
AKHtmlVisitor >> visitElementAttribute: anAttribute [
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitEmailInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitFileInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitForm: anElement [
	self visitContentElement: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitFormElement: anElement [
	self visitContentElement: anElement
]

{ #category : #'visiting head' }
AKHtmlVisitor >> visitHead: anElement [
	self visitElement: anElement
]

{ #category : #'visiting body' }
AKHtmlVisitor >> visitHeading: anElement [
	self visitContentElement: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitHiddenInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitImageInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting body' }
AKHtmlVisitor >> visitImg: anElement [
	self visitElement: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitInput:  anElement [
	self visitFormElement: anElement
]

{ #category : #'visiting head' }
AKHtmlVisitor >> visitLink: anElement [
	self visitElement: anElement
]

{ #category : #'visiting head' }
AKHtmlVisitor >> visitMeta: anElement [
	self visitElement: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitMonthInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitNumberInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitPasswordInput:  anElement [
	self visitInput: anElement
]

{ #category : #visiting }
AKHtmlVisitor >> visitRootHtml: anElement [
	self visitElement: anElement
]

{ #category : #'visiting body' }
AKHtmlVisitor >> visitScript: anElement [
	self visitElement: anElement
]

{ #category : #'visiting body' }
AKHtmlVisitor >> visitSpan: anElement [
	self visitContentElement: anElement
]

{ #category : #'visiting body' }
AKHtmlVisitor >> visitStrong: anElement [
	self visitContentElement: anElement
]

{ #category : #visiting }
AKHtmlVisitor >> visitTemplate: anElement [
	self visit: anElement document
]

{ #category : #'visiting body' }
AKHtmlVisitor >> visitText: anElement [
	
]

{ #category : #'visiting form' }
AKHtmlVisitor >> visitTextInput:  anElement [
	self visitInput: anElement
]

{ #category : #'visiting head' }
AKHtmlVisitor >> visitTitle: anElement [
	self visitElement: anElement
]
