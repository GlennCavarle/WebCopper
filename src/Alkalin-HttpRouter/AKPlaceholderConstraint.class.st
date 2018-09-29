Class {
	#name : #AKPlaceholderConstraint,
	#superclass : #AKAbstractPlaceholderConstraint,
	#category : #'Alkalin-HttpRouter-Placeholder'
}

{ #category : #accessing }
AKPlaceholderConstraint class >> any [
	^ AKPlaceholderAny
]

{ #category : #accessing }
AKPlaceholderConstraint class >> int [
	^ AKPlaceholderInt
]

{ #category : #accessing }
AKPlaceholderConstraint class >> uuid [
	^ AKPlaceholderUuid
]

{ #category : #accessing }
AKPlaceholderConstraint class >> word [
	^ AKPlaceholderWord 
]
