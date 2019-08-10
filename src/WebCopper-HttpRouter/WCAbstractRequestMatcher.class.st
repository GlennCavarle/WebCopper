Class {
	#name : #WCAbstractRequestMatcher,
	#superclass : #Object,
	#category : #'WebCopper-HttpRouter-Matcher'
}

{ #category : #testing }
WCAbstractRequestMatcher >> matchRequest: anHttpRequest [
	self subclassResponsibility 
]
