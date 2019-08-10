Class {
	#name : #WCPlaceholderAny,
	#superclass : #WCPlaceholderConstraint,
	#category : #'WebCopper-HttpRouter-Placeholder'
}

{ #category : #testing }
WCPlaceholderAny class >> converter [
	^ [:str | str asString]
]

{ #category : #testing }
WCPlaceholderAny class >> regexString [
	^ '.+'
]
