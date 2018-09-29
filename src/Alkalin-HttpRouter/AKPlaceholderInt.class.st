Class {
	#name : #AKPlaceholderInt,
	#superclass : #AKPlaceholderConstraint,
	#category : #'Alkalin-HttpRouter-Placeholder'
}

{ #category : #testing }
AKPlaceholderInt class >> converter [
	^ [ :str | str asInteger ] 
]

{ #category : #testing }
AKPlaceholderInt class >> regexString [
	^ '-?\d+'
]
