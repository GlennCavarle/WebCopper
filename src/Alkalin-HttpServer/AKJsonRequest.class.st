Class {
	#name : #AKJsonRequest,
	#superclass : #AKHttpRequest,
	#category : #'Alkalin-HttpServer-Message'
}

{ #category : #'as yet unclassified' }
AKJsonRequest class >> post: anUrlObject data: anObject [
	^ (AKJsonRequest post: anUrlObject)
		entity: (AKJsonEntity json: (NeoJSONWriter toString: anObject));
		yourself
]

{ #category : #accessing }
AKJsonRequest >> setDefaultHeaders [
	self setAccept: ZnMimeType applicationJson
]
