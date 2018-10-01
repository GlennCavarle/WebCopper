Class {
	#name : #AKHttpResponse,
	#superclass : #ZnResponse,
	#category : #'Alkalin-HttpMessage-Response'
}

{ #category : #accessing }
AKHttpResponse >> headers: object [
	headers := object.
	self setDefaultHeaders
]

{ #category : #testing }
AKHttpResponse >> isHttpResponse [
	^ true
]

{ #category : #initialization }
AKHttpResponse >> setDefaultHeaders [
]
