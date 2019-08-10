Class {
	#name : #WCHtmlBuilder,
	#superclass : #Object,
	#category : #'WebCopper-Html-Builder'
}

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> body [
	^ WCHtmlBody new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> button [
	^ WCHtmlButton new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> checkbox [
	^ WCHtmlCheckbox new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> div [
	^ WCHtmlDiv new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> doctype [
	^ WCHtmlDoctype new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> document [
	^ WCHtmlDocument new
]

{ #category : #accessing }
WCHtmlBuilder class >> form [
	^ WCHtmlForm new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> head [
	^ WCHtmlHead new
]

{ #category : #formatting }
WCHtmlBuilder class >> heading: aNumber [
	^ WCHtmlHeading level: aNumber
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> img [
	^ WCHtmlImg new
]

{ #category : #accessing }
WCHtmlBuilder class >> input [
	^ WCHtmlInput new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> link [
	^ WCHtmlLink new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> meta [
	^ WCHtmlMeta new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> root [
	^ WCHtmlRootHtml new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> script [
	^ WCHtmlScript new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> span [
	^ WCHtmlSpan new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> strong [
	^ WCHtmlStrong new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> text [
	^ WCHtmlText new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> textInput [
	^ WCHtmlTextInput new
]

{ #category : #'as yet unclassified' }
WCHtmlBuilder class >> title [
	^ WCHtmlTitle new
]
