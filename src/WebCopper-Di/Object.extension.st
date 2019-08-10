Extension { #name : #Object }

{ #category : #'*WebCopper-Di' }
Object >> asWCRef [
	^ WCDiObjectReference object: self
]

{ #category : #'*WebCopper-Di' }
Object >> isWCRef [
	^ false
]
