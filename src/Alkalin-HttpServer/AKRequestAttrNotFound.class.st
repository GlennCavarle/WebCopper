Class {
	#name : #AKRequestAttrNotFound,
	#superclass : #AKException,
	#instVars : [
		'attribute'
	],
	#category : #'Alkalin-HttpServer-Exception'
}

{ #category : #signalling }
AKRequestAttrNotFound class >> signalForAttr: aSymbol [
	(self new
		attribute: aSymbol;
		yourself) signal: ('Request attribute {1} not found' format: {aSymbol asString})
]
