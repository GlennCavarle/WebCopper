Class {
	#name : #WCHtmlResponseBuilder,
	#superclass : #WCHttpResponseBuilder,
	#category : #'WebCopper-HttpKernel-ResponseBuilder'
}

{ #category : #testing }
WCHtmlResponseBuilder class >> matches: aMimeType [
	^ aMimeType asZnMimeType = ZnMimeType textHtml
]

{ #category : #building }
WCHtmlResponseBuilder >> build: anObject [
	^ WCHtmlResponse code: 200 data: anObject
]
