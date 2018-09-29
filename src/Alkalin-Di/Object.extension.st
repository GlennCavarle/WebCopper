Extension { #name : #Object }

{ #category : #'*Alkalin-Di' }
Object >> asAKRef [
	^ AKDiObjectReference object: self
]

{ #category : #'*Alkalin-Di' }
Object >> isAKRef [
	^ false
]
