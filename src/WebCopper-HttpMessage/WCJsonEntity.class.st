Class {
	#name : #WCJsonEntity,
	#superclass : #ZnStringEntity,
	#instVars : [
		'fields'
	],
	#category : #'WebCopper-HttpMessage-Entity'
}

{ #category : #testing }
WCJsonEntity class >> designatedMimeType [
	^ ZnMimeType applicationJson
]

{ #category : #accessing }
WCJsonEntity >> add: association [
	self at: association key put: association value
]

{ #category : #accessing }
WCJsonEntity >> addAll: keyedCollection [
	"Note that we use #addAllMulti:"

	self invalidateRepresentation.
	self fields addAllMulti: keyedCollection.
	^ keyedCollection 
]

{ #category : #accessing }
WCJsonEntity >> at: key [
	^ self fields at: key
]

{ #category : #accessing }
WCJsonEntity >> at: key ifAbsent: block [
	^ self fields at: key ifAbsent: block
]

{ #category : #initialization }
WCJsonEntity >> at: key put: value [
	self invalidateRepresentation.
	^ self fields at: key put: value
]

{ #category : #initialization }
WCJsonEntity >> computeRepresentation [
	string := String streamContents: [ :stream | self writeRepresentationOn: stream ].
	contentLength := string size
]

{ #category : #accessing }
WCJsonEntity >> contentLength [
	contentLength isNil ifTrue: [ self computeRepresentation ].
	^ contentLength 
]

{ #category : #accessing }
WCJsonEntity >> fields [
	^ fields
]

{ #category : #accessing }
WCJsonEntity >> fieldsDo: block [
	self fields keysAndValuesDo: block
]

{ #category : #testing }
WCJsonEntity >> hasFields [
	^ true
]

{ #category : #accessing }
WCJsonEntity >> includesField: field [
	^ self fields includesKey: field
]

{ #category : #initialization }
WCJsonEntity >> initialize [
	super initialize.
	fields := ZnMultiValueDictionary new.
	self contentType: self class designatedMimeType 
]

{ #category : #initialization }
WCJsonEntity >> invalidateRepresentation [
	string := nil.
	contentLength := nil
]

{ #category : #initialization }
WCJsonEntity >> isEmpty [
	^ self fields isEmpty
]

{ #category : #accessing }
WCJsonEntity >> string: aString [
	super string: aString.
	self addAll: (NeoJSONReader fromString: aString)
]

{ #category : #writing }
WCJsonEntity >> writeOn: stream [
	"In most use cases, contentLength will have been asked first so that a representation is cached"

	string isNil ifTrue: [ self computeRepresentation ].
	super writeOn: stream
]

{ #category : #initialization }
WCJsonEntity >> writeRepresentationOn: stream [
	(NeoJSONWriter on: stream) nextPut: self fields
]
