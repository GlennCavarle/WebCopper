Class {
	#name : #AKPlaceholderWord,
	#superclass : #AKPlaceholderConstraint,
	#category : #'Alkalin-HttpRouter-Placeholder'
}

{ #category : #testing }
AKPlaceholderWord class >> converter [
	^ [ :str | str asString]
]

{ #category : #testing }
AKPlaceholderWord class >> regexString [
	^ '\w+'
]
