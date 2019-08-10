Class {
	#name : #WCRequestAttrNotFound,
	#superclass : #WCException,
	#instVars : [
		'attribute'
	],
	#category : #'WebCopper-HttpMessage-Exception'
}

{ #category : #signalling }
WCRequestAttrNotFound class >> signalForAttr: aSymbol [
	(self new
		attribute: aSymbol;
		yourself) signal: ('Request attribute {1} not found' format: {aSymbol asString})
]
