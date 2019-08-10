Extension { #name : #BlockClosure }

{ #category : #'*WebCopper-HttpRouter' }
BlockClosure >> asWCAction [
	^ WCClosureAction do: self
]
