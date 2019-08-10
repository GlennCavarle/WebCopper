Class {
	#name : #WCHtmlRequest,
	#superclass : #WCHttpRequest,
	#category : #'WebCopper-HttpMessage-Request'
}

{ #category : #'as yet unclassified' }
WCHtmlRequest class >> post: anUrlObject data: anObject [
	|entity|
	
	entity := ZnMultiPartFormDataEntity new.
	anObject asDictionary keysAndValuesDo: [:k :v|
		entity addPart: (ZnMimePart fieldName: k value: v)].

	^ (WCHtmlRequest post: anUrlObject)
		entity: entity;
		yourself
]

{ #category : #accessing }
WCHtmlRequest >> setDefaultHeaders [
	self setAccept: ZnMimeType textHtml
]
