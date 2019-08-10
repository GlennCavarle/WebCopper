Class {
	#name : #WCHttpResponse,
	#superclass : #ZnResponse,
	#category : #'WebCopper-HttpMessage-Response'
}

{ #category : #accessing }
WCHttpResponse >> headers: object [
	headers := object.
	self setDefaultHeaders
]

{ #category : #testing }
WCHttpResponse >> isHttpResponse [
	^ true
]

{ #category : #initialization }
WCHttpResponse >> setDefaultHeaders [
]
