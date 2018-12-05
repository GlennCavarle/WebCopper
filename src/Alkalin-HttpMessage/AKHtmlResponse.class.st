Class {
	#name : #AKHtmlResponse,
	#superclass : #AKHttpResponse,
	#category : #'Alkalin-HttpMessage-Response'
}

{ #category : #'as yet unclassified' }
AKHtmlResponse class >> code: anHttpCode data: aObject [
	
^ self new
		statusLine: (ZnStatusLine code: anHttpCode);
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnStringEntity 
			with:  aObject asString 
			type: (ZnMimeType textHtml charSet: 'utf-8'; yourself));
		yourself
]

{ #category : #initialization }
AKHtmlResponse >> setDefaultHeaders [
	self setContentType: ZnMimeType textHtml 
]
