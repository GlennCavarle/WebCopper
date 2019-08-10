Class {
	#name : #WCJsonRequest,
	#superclass : #WCHttpRequest,
	#category : #'WebCopper-HttpMessage-Request'
}

{ #category : #'as yet unclassified' }
WCJsonRequest class >> post: anUrlObject data: anObject [
	^ (WCJsonRequest post: anUrlObject)
		entity: (WCJsonEntity json: (NeoJSONWriter toString: anObject));
		yourself
]

{ #category : #accessing }
WCJsonRequest >> setDefaultHeaders [
	self setAccept: ZnMimeType applicationJson
]
