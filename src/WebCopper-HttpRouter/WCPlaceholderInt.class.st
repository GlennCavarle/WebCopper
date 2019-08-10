Class {
	#name : #WCPlaceholderInt,
	#superclass : #WCPlaceholderConstraint,
	#category : #'WebCopper-HttpRouter-Placeholder'
}

{ #category : #testing }
WCPlaceholderInt class >> converter [
	^ [ :str | str asInteger ] 
]

{ #category : #testing }
WCPlaceholderInt class >> regexString [
	^ '-?\d+'
]
