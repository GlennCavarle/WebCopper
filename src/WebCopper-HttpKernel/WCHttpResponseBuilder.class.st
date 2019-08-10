Class {
	#name : #WCHttpResponseBuilder,
	#superclass : #Object,
	#category : #'WebCopper-HttpKernel-ResponseBuilder'
}

{ #category : #'instance creation' }
WCHttpResponseBuilder class >> fromContentType: aMimeType [
	"Answer the concrete Builder that handles mimeType"

	| builderClass |
	builderClass := self allSubclasses detect: [ :each | each matches: aMimeType ].
	^ builderClass new
]

{ #category : #testing }
WCHttpResponseBuilder class >> matches: aMimeType [
	self subclassResponsibility 
]

{ #category : #building }
WCHttpResponseBuilder >> build: anObject [
	self subclassResponsibility 
]
