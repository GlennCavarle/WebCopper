Class {
	#name : #WCJsonResponseBuilder,
	#superclass : #WCHttpResponseBuilder,
	#category : #'WebCopper-HttpKernel-ResponseBuilder'
}

{ #category : #testing }
WCJsonResponseBuilder class >> matches: aMimeType [
	^ aMimeType asZnMimeType = ZnMimeType applicationJson
]

{ #category : #building }
WCJsonResponseBuilder >> build: anObject [
	^ WCJsonResponse code: 200 data: anObject
]
