Class {
	#name : #WCInvalidPathPrefix,
	#superclass : #WCRequestRoutingException,
	#instVars : [
		'prefix'
	],
	#category : #'WebCopper-HttpRouter-Exception'
}

{ #category : #signalling }
WCInvalidPathPrefix class >> signalForPrefix: aString inRequest: aAKHttpRequest [
	self new
		request: aAKHttpRequest;
		prefix: aString;
		signal: ('Request path "{1}" does not match prefix "{2}"'
					format: {aAKHttpRequest url location. aString})
]

{ #category : #accessing }
WCInvalidPathPrefix >> prefix [
	^ prefix
]

{ #category : #accessing }
WCInvalidPathPrefix >> prefix: anObject [
	prefix := anObject
]
