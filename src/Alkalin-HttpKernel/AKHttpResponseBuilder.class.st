Class {
	#name : #AKHttpResponseBuilder,
	#superclass : #Object,
	#category : #'Alkalin-HttpKernel-ResponseBuilder'
}

{ #category : #'instance creation' }
AKHttpResponseBuilder class >> fromContentType: aMimeType [
	"Answer the concrete Builder that handles mimeType"

	| builderClass |
	builderClass := self allSubclasses detect: [ :each | each matches: aMimeType ].
	^ builderClass new
]

{ #category : #testing }
AKHttpResponseBuilder class >> matches: aMimeType [
	self subclassResponsibility 
]

{ #category : #building }
AKHttpResponseBuilder >> build: anObject [
	self subclassResponsibility 
]
