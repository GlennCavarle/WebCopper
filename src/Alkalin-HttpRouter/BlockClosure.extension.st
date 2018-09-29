Extension { #name : #BlockClosure }

{ #category : #'*Alkalin-HttpRouter' }
BlockClosure >> asAKAction [
	^ AKClosureAction do: self
]
