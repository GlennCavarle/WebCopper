Extension { #name : #Symbol }

{ #category : #'*WebCopper-Di' }
Symbol >> asUnary [
	self isUnary ifTrue: [ ^ self ].
	^ (self copyReplaceAll: ':' with: '') asSymbol
]
