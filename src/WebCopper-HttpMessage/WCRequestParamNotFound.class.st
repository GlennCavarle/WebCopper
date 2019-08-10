Class {
	#name : #WCRequestParamNotFound,
	#superclass : #WCException,
	#instVars : [
		'parameter'
	],
	#category : #'WebCopper-HttpMessage-Exception'
}

{ #category : #signalling }
WCRequestParamNotFound class >> signalForParam: aSymbol [
	(self new
		parameter: aSymbol;
		yourself) signal: ('Request parameter {1} not found' format: {aSymbol asString})
]

{ #category : #accessing }
WCRequestParamNotFound >> parameter [
	^ parameter
]

{ #category : #accessing }
WCRequestParamNotFound >> parameter: anObject [
	parameter := anObject
]
