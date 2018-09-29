Class {
	#name : #AKPlaceholderAny,
	#superclass : #AKPlaceholderConstraint,
	#category : #'Alkalin-HttpRouter-Placeholder'
}

{ #category : #testing }
AKPlaceholderAny class >> converter [
	^ [:str | str asString]
]

{ #category : #testing }
AKPlaceholderAny class >> regexString [
	^ '.+'
]
