Class {
	#name : #AKRouter,
	#superclass : #Object,
	#category : #'Alkalin-HttpRouter-Router'
}

{ #category : #testing }
AKRouter >> matchRequest: aRequest [
	self subclassResponsibility
]

{ #category : #accessing }
AKRouter >> routeForRequest: aRequest [
	self subclassResponsibility
]
