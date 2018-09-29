Class {
	#name : #AKJsonEntity,
	#superclass : #ZnStringEntity,
	#instVars : [
		'fields'
	],
	#category : #'Alkalin-HttpServer-Message'
}

{ #category : #testing }
AKJsonEntity class >> designatedMimeType [
	^ ZnMimeType applicationJson
]

{ #category : #accessing }
AKJsonEntity >> add: association [
	self at: association key put: association value
]

{ #category : #accessing }
AKJsonEntity >> addAll: keyedCollection [
	"Note that we use #addAllMulti:"

	self invalidateRepresentation.
	self fields addAllMulti: keyedCollection.
	^ keyedCollection 
]

{ #category : #accessing }
AKJsonEntity >> at: key [
	^ self fields at: key
]

{ #category : #accessing }
AKJsonEntity >> at: key ifAbsent: block [
	^ self fields at: key ifAbsent: block
]

{ #category : #initialization }
AKJsonEntity >> at: key put: value [
	self invalidateRepresentation.
	^ self fields at: key put: value
]

{ #category : #initialization }
AKJsonEntity >> computeRepresentation [
	string := String streamContents: [ :stream | self writeRepresentationOn: stream ].
	contentLength := string size
]

{ #category : #accessing }
AKJsonEntity >> contentLength [
	contentLength isNil ifTrue: [ self computeRepresentation ].
	^ contentLength 
]

{ #category : #accessing }
AKJsonEntity >> fields [
	^ fields
]

{ #category : #accessing }
AKJsonEntity >> fieldsDo: block [
	self fields keysAndValuesDo: block
]

{ #category : #testing }
AKJsonEntity >> hasFields [
	^ true
]

{ #category : #accessing }
AKJsonEntity >> includesField: field [
	^ self fields includesKey: field
]

{ #category : #initialization }
AKJsonEntity >> initialize [
	super initialize.
	fields := ZnMultiValueDictionary new.
	self contentType: self class designatedMimeType 
]

{ #category : #initialization }
AKJsonEntity >> invalidateRepresentation [
	string := nil.
	contentLength := nil
]

{ #category : #initialization }
AKJsonEntity >> isEmpty [
	^ self fields isEmpty
]

{ #category : #accessing }
AKJsonEntity >> string: aString [
	super string: aString.
	self addAll: (NeoJSONReader fromString: aString)
]

{ #category : #writing }
AKJsonEntity >> writeOn: stream [
	"In most use cases, contentLength will have been asked first so that a representation is cached"

	string isNil ifTrue: [ self computeRepresentation ].
	super writeOn: stream
]

{ #category : #initialization }
AKJsonEntity >> writeRepresentationOn: stream [
	(NeoJSONWriter on: stream) nextPut: self fields
]
