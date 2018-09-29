Class {
	#name : #AKHtmlRenderer,
	#superclass : #AKHtmlVisitor,
	#instVars : [
		'level',
		'stream'
	],
	#category : #'Alkalin-Html-Renderer'
}

{ #category : #'as yet unclassified' }
AKHtmlRenderer class >> renderHtml: anElement [
	^ self new renderHtml: anElement
]

{ #category : #initialization }
AKHtmlRenderer >> initialize [
	super initialize.
	stream := WriteStream on: String new.
	self level: 0
]

{ #category : #accessing }
AKHtmlRenderer >> level [
	^ level
]

{ #category : #accessing }
AKHtmlRenderer >> level: anObject [
	level := anObject
]

{ #category : #utilities }
AKHtmlRenderer >> on: aStream indent: aBlock [
	self level: self level + 1.
	aStream tab: self level.
	aBlock ensure: [ self level: self level - 1 ]
]

{ #category : #rendering }
AKHtmlRenderer >> renderAttribute: anAttribute on: aStream [
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
AKHtmlRenderer >> renderElement: anElement on: aStream [
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
AKHtmlRenderer >> renderElementCloseTag: anElement on: aStream [
	aStream nextPutAll: '</', anElement tag, '>'
]

{ #category : #rendering }
AKHtmlRenderer >> renderElementOpenTag: anElement on: aStream [
	aStream nextPutAll: '<' , anElement tag.
	anElement attributes valuesDo: [ :attr | attr accept: self ].
	aStream nextPutAll: '>'
]

{ #category : #rendering }
AKHtmlRenderer >> renderHtml: anElement [
	self visit: anElement.
	^ stream contents
]

{ #category : #rendering }
AKHtmlRenderer >> renderSelfClosingElement: anElement on: aStream [
	aStream nextPutAll: '<' , anElement tag.
	anElement attributes valuesDo: [  :attr | attr accept: self  ].
	aStream nextPutAll: '/>'
]

{ #category : #accessing }
AKHtmlRenderer >> stream [
	^ stream
]

{ #category : #accessing }
AKHtmlRenderer >> stream: anObject [
	stream := anObject
]

{ #category : #visiting }
AKHtmlRenderer >> visitDoctype: anElement [
	stream
		nextPutAll: '<! ' , anElement instruction , '>';
		cr
]

{ #category : #visiting }
AKHtmlRenderer >> visitElement: anElement [
	self renderElement: anElement on: stream
]

{ #category : #visiting }
AKHtmlRenderer >> visitElementAttribute: anAttribute [
	self renderAttribute: anAttribute on: stream
]

{ #category : #visiting }
AKHtmlRenderer >> visitText: anElement [
	stream
		nextPutAll: anElement text;
		cr
]
