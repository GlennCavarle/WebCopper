Class {
	#name : #AKHtmlResponseBuilder,
	#superclass : #AKHttpResponseBuilder,
	#category : #'Alkalin-HttpKernel-ResponseBuilder'
}

{ #category : #testing }
AKHtmlResponseBuilder class >> matches: aMimeType [
	^ aMimeType asZnMimeType = ZnMimeType textHtml
]

{ #category : #building }
AKHtmlResponseBuilder >> build: anObject [
	^ AKHtmlResponse code: 200 data: anObject
]
