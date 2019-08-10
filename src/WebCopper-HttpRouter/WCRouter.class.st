Class {
	#name : #WCRouter,
	#superclass : #Object,
	#category : #'WebCopper-HttpRouter-Router'
}

{ #category : #testing }
WCRouter >> matchRequest: aRequest [
	self subclassResponsibility
]

{ #category : #accessing }
WCRouter >> routeForRequest: aRequest [
	self subclassResponsibility
]
