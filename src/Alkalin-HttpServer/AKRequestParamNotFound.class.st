Class {
	#name : #AKRequestParamNotFound,
	#superclass : #AKException,
	#instVars : [
		'parameter'
	],
	#category : #'Alkalin-HttpServer-Exception'
}

{ #category : #signalling }
AKRequestParamNotFound class >> signalForParam: aSymbol [
	(self new
		parameter: aSymbol;
		yourself) signal: ('Request parameter {1} not found' format: {aSymbol asString})
]

{ #category : #accessing }
AKRequestParamNotFound >> parameter [
	^ parameter
]

{ #category : #accessing }
AKRequestParamNotFound >> parameter: anObject [
	parameter := anObject
]
