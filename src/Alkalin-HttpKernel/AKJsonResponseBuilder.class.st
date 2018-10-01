Class {
	#name : #AKJsonResponseBuilder,
	#superclass : #AKHttpResponseBuilder,
	#category : #'Alkalin-HttpKernel-ResponseBuilder'
}

{ #category : #testing }
AKJsonResponseBuilder class >> matches: aMimeType [
	^ aMimeType asZnMimeType = ZnMimeType applicationJson
]

{ #category : #building }
AKJsonResponseBuilder >> build: anObject [
	^ AKJsonResponse code: 200 data: anObject
]
