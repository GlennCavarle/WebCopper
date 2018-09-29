Class {
	#name : #AKPlaceholderUuid,
	#superclass : #AKPlaceholderConstraint,
	#category : #'Alkalin-HttpRouter-Placeholder'
}

{ #category : #testing }
AKPlaceholderUuid class >> converter [
	^ [ :str| UUID fromString: str]
]

{ #category : #testing }
AKPlaceholderUuid class >> regexString [
	^ '([a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}){1}'
]
