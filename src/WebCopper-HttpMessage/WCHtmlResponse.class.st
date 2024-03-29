Class {
	#name : #WCHtmlResponse,
	#superclass : #WCHttpResponse,
	#category : #'WebCopper-HttpMessage-Response'
}

{ #category : #'as yet unclassified' }
WCHtmlResponse class >> code: anHttpCode data: aObject [
	
^ self new
		statusLine: (ZnStatusLine code: anHttpCode);
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnStringEntity 
			with:  aObject asString 
			type: (ZnMimeType textHtml charSet: 'utf-8'; yourself));
		yourself
]

{ #category : #initialization }
WCHtmlResponse >> setDefaultHeaders [
	self setContentType: ZnMimeType textHtml 
]
