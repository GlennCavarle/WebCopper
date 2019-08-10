Class {
	#name : #WCPlaceholderWord,
	#superclass : #WCPlaceholderConstraint,
	#category : #'WebCopper-HttpRouter-Placeholder'
}

{ #category : #testing }
WCPlaceholderWord class >> converter [
	^ [ :str | str asString]
]

{ #category : #testing }
WCPlaceholderWord class >> regexString [
	^ '\w+'
]
