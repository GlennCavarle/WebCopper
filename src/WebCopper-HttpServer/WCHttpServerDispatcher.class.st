Class {
	#name : #WCHttpServerDispatcher,
	#superclass : #Object,
	#instVars : [
		'prefixMap'
	],
	#category : #'WebCopper-HttpServer-Server'
}

{ #category : #'request handling' }
WCHttpServerDispatcher >> handleRequest: request [
<return: #WCHttpResponse>
	| prefix handler|
	prefix := '/'.
	request uri firstPathSegment ifNotNil: [ :seg | prefix := prefix , seg ].
	
	handler := prefixMap at: prefix ifAbsent:[
		prefixMap at: #default 
			ifPresent:[:h| ^ h handleRequest: request]
			ifAbsent:[^ WCHttpResponse notFound: request uri]].
	
	^ request withPrefix: prefix do: [ 
		handler handleRequest: request.
	].
	
	
	
]

{ #category : #accessing }
WCHttpServerDispatcher >> map: prefix to: handler [
	"Arrange for the receiver to dispatch requests matching prefix to handler.
	Handler can be a symbol naming a method in the receiver, 
	or a block accepting the request and producing the response.
	The special prefix '/' is resolved first and can refer to another prefix."
	
	self prefixMap 
		at: prefix
		put: handler
		
]

{ #category : #accessing }
WCHttpServerDispatcher >> prefixMap [
	^ prefixMap ifNil: [ prefixMap := Dictionary new ]
]
