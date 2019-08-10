Class {
	#name : #WCPlaceholderUuid,
	#superclass : #WCPlaceholderConstraint,
	#category : #'WebCopper-HttpRouter-Placeholder'
}

{ #category : #testing }
WCPlaceholderUuid class >> converter [
	^ [ :str| UUID fromString: str]
]

{ #category : #testing }
WCPlaceholderUuid class >> regexString [
	^ '([a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12}){1}'
]
