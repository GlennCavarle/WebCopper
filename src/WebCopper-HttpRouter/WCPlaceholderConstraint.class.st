Class {
	#name : #WCPlaceholderConstraint,
	#superclass : #WCAbstractPlaceholderConstraint,
	#category : #'WebCopper-HttpRouter-Placeholder'
}

{ #category : #accessing }
WCPlaceholderConstraint class >> any [
	^ WCPlaceholderAny
]

{ #category : #accessing }
WCPlaceholderConstraint class >> int [
	^ WCPlaceholderInt
]

{ #category : #accessing }
WCPlaceholderConstraint class >> uuid [
	^ WCPlaceholderUuid
]

{ #category : #accessing }
WCPlaceholderConstraint class >> word [
	^ WCPlaceholderWord 
]
