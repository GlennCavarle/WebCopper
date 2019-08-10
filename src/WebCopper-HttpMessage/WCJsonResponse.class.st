Class {
	#name : #WCJsonResponse,
	#superclass : #WCHttpResponse,
	#category : #'WebCopper-HttpMessage-Response'
}

{ #category : #'instance creation' }
WCJsonResponse class >> code: anHttpCode data: aObject [
	
^ self new
		statusLine: (ZnStatusLine code: anHttpCode);
		headers: ZnHeaders defaultResponseHeaders;
		entity: (ZnStringEntity 
			with: (NeoJSONWriter toString: aObject) 
			type: (ZnMimeType applicationJson charSet: 'utf-8'; yourself));
		yourself
]

{ #category : #initialization }
WCJsonResponse >> setDefaultHeaders [
	self setContentType: ZnMimeType applicationJson 
]
