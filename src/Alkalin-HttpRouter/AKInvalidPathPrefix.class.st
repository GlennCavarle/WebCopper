Class {
	#name : #AKInvalidPathPrefix,
	#superclass : #AKRequestRoutingException,
	#instVars : [
		'prefix'
	],
	#category : #'Alkalin-HttpRouter-Exception'
}

{ #category : #signalling }
AKInvalidPathPrefix class >> signalForPrefix: aString inRequest: aAKHttpRequest [
	self new
		request: aAKHttpRequest;
		prefix: aString;
		signal: ('Request path "{1}" does not match prefix "{2}"'
					format: {aAKHttpRequest url location. aString})
]

{ #category : #accessing }
AKInvalidPathPrefix >> prefix [
	^ prefix
]

{ #category : #accessing }
AKInvalidPathPrefix >> prefix: anObject [
	prefix := anObject
]
