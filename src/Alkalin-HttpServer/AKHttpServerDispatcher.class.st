Class {
	#name : #AKHttpServerDispatcher,
	#superclass : #Object,
	#instVars : [
		'prefixMap'
	],
	#category : #'Alkalin-HttpServer-Server'
}

{ #category : #'request handling' }
AKHttpServerDispatcher >> handleRequest: request [
<return: #AKHttpResponse>
	| prefix handler|
	prefix := '/'.
	request uri firstPathSegment ifNotNil: [ :seg | prefix := prefix , seg ].
	
	handler := prefixMap at: prefix ifAbsent:[
		prefixMap at: #default 
			ifPresent:[:h| ^ h handleRequest: request]
			ifAbsent:[^ AKHttpResponse notFound: request uri]].
	
	^ request withPrefix: prefix do: [ 
		handler handleRequest: request.
	].
	
	
	
]

{ #category : #accessing }
AKHttpServerDispatcher >> map: prefix to: handler [
	"Arrange for the receiver to dispatch requests matching prefix to handler.
	Handler can be a symbol naming a method in the receiver, 
	or a block accepting the request and producing the response.
	The special prefix '/' is resolved first and can refer to another prefix."
	
	self prefixMap 
		at: prefix
		put: handler
		
]

{ #category : #accessing }
AKHttpServerDispatcher >> prefixMap [
	^ prefixMap ifNil: [ prefixMap := Dictionary new ]
]
