Class {
	#name : #AKHtmlRequest,
	#superclass : #AKHttpRequest,
	#category : #'Alkalin-HttpMessage-Request'
}

{ #category : #'as yet unclassified' }
AKHtmlRequest class >> post: anUrlObject data: anObject [
	|entity|
	
	entity := ZnMultiPartFormDataEntity new.
	anObject asDictionary keysAndValuesDo: [:k :v|
		entity addPart: (ZnMimePart fieldName: k value: v)].

	^ (AKHtmlRequest post: anUrlObject)
		entity: entity;
		yourself
]

{ #category : #accessing }
AKHtmlRequest >> setDefaultHeaders [
	self setAccept: ZnMimeType textHtml
]
