Class {
	#name : #AKJsonResponse,
	#superclass : #AKHttpResponse,
	#category : #'Alkalin-HttpServer-Message'
}

{ #category : #'as yet unclassified' }
AKJsonResponse class >> code: anHttpCode data: aObject [
	
^ self new
		statusLine: (ZnStatusLine code: anHttpCode);
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnStringEntity 
			with: (NeoJSONWriter toString: aObject) 
			type: (ZnMimeType applicationJson charSet: 'utf-8'; yourself));
		yourself
]

{ #category : #initialization }
AKJsonResponse >> setDefaultHeaders [
	self setContentType: ZnMimeType applicationJson 
]
