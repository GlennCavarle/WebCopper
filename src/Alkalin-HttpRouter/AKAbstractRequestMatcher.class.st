Class {
	#name : #AKAbstractRequestMatcher,
	#superclass : #Object,
	#category : #'Alkalin-HttpRouter-Matcher'
}

{ #category : #testing }
AKAbstractRequestMatcher >> matchRequest: anHttpRequest [
	self subclassResponsibility 
]
