Class {
	#name : #AKHtmlBuilder,
	#superclass : #Object,
	#category : #'Alkalin-Html-Builder'
}

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> body [
	^ AKHtmlBody new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> button [
	^ AKHtmlButton new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> checkbox [
	^ AKHtmlCheckbox new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> div [
	^ AKHtmlDiv new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> doctype [
	^ AKHtmlDoctype new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> document [
	^ AKHtmlDocument new
]

{ #category : #accessing }
AKHtmlBuilder class >> form [
	^ AKHtmlForm new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> head [
	^ AKHtmlHead new
]

{ #category : #formatting }
AKHtmlBuilder class >> heading: aNumber [
	^ AKHtmlHeading level: aNumber
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> img [
	^ AKHtmlImg new
]

{ #category : #accessing }
AKHtmlBuilder class >> input [
	^ AKHtmlInput new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> link [
	^ AKHtmlLink new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> meta [
	^ AKHtmlMeta new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> root [
	^ AKHtmlRootHtml new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> script [
	^ AKHtmlScript new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> span [
	^ AKHtmlSpan new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> strong [
	^ AKHtmlStrong new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> text [
	^ AKHtmlText new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> textInput [
	^ AKHtmlTextInput new
]

{ #category : #'as yet unclassified' }
AKHtmlBuilder class >> title [
	^ AKHtmlTitle new
]
