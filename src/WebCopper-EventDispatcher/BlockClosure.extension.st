Extension { #name : #BlockClosure }

{ #category : #'*WebCopper-EventDispatcher' }
BlockClosure >> asWCEventListener [
	^ WCClosureEventListener do: self
]
