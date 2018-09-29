Extension { #name : #BlockClosure }

{ #category : #'*Alkalin-EventDispatcher' }
BlockClosure >> asAKEventListener [
	^ AKClosureEventListener do: self
]
