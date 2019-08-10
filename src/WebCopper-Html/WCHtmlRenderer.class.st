Class {
	#name : #WCHtmlRenderer,
	#superclass : #WCHtmlVisitor,
	#instVars : [
		'level',
		'stream'
	],
	#category : #'WebCopper-Html-Renderer'
}

{ #category : #'as yet unclassified' }
WCHtmlRenderer class >> renderHtml: anElement [
	^ self new renderHtml: anElement
]

{ #category : #initialization }
WCHtmlRenderer >> initialize [
	super initialize.
	stream := WriteStream on: String new.
	self level: 0
]

{ #category : #accessing }
WCHtmlRenderer >> level [
	^ level
]

{ #category : #accessing }
WCHtmlRenderer >> level: anObject [
	level := anObject
]

{ #category : #utilities }
WCHtmlRenderer >> on: aStream indent: aBlock [
	self level: self level + 1.
	aStream tab: self level.
	aBlock ensure: [ self level: self level - 1 ]
]

{ #category : #rendering }
WCHtmlRenderer >> renderAttribute: anAttribute on: aStream [
	aStream
		nextPut: Character space;
		nextPutAll: anAttribute name.
		
		anAttribute value ifNotNil:[:v|
		aStream 
			nextPutAll: '="';
			nextPutAll: v asString;
			nextPut: $"
		]
]

{ #category : #rendering }
WCHtmlRenderer >> renderElement: anElement on: aStream [
	anElement selfClosing
		ifTrue: [ self renderSelfClosingElement: anElement on: aStream ]
		ifFalse: [ 
			self renderElementOpenTag: anElement on: aStream.
			
			anElement children ifNotEmpty: [:children| 
					aStream cr.
					children do: [ :each | self on: aStream indent: [ each accept: self ] ].
					aStream tab: self level ].
				
			self renderElementCloseTag: anElement on: aStream ].
	aStream cr.
]

{ #category : #rendering }
WCHtmlRenderer >> renderElementCloseTag: anElement on: aStream [
	aStream nextPutAll: '</', anElement tag, '>'
]

{ #category : #rendering }
WCHtmlRenderer >> renderElementOpenTag: anElement on: aStream [
	aStream nextPutAll: '<' , anElement tag.
	anElement attributes valuesDo: [ :attr | attr accept: self ].
	aStream nextPutAll: '>'
]

{ #category : #rendering }
WCHtmlRenderer >> renderHtml: anElement [
	self visit: anElement.
	^ stream contents
]

{ #category : #rendering }
WCHtmlRenderer >> renderSelfClosingElement: anElement on: aStream [
	aStream nextPutAll: '<' , anElement tag.
	anElement attributes valuesDo: [  :attr | attr accept: self  ].
	aStream nextPutAll: '/>'
]

{ #category : #accessing }
WCHtmlRenderer >> stream [
	^ stream
]

{ #category : #accessing }
WCHtmlRenderer >> stream: anObject [
	stream := anObject
]

{ #category : #visiting }
WCHtmlRenderer >> visitDoctype: anElement [
	stream
		nextPutAll: '<! ' , anElement instruction , '>';
		cr
]

{ #category : #visiting }
WCHtmlRenderer >> visitElement: anElement [
	self renderElement: anElement on: stream
]

{ #category : #visiting }
WCHtmlRenderer >> visitElementAttribute: anAttribute [
	self renderAttribute: anAttribute on: stream
]

{ #category : #visiting }
WCHtmlRenderer >> visitText: anElement [
	stream
		nextPutAll: anElement text;
		cr
]
