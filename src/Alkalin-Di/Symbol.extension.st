Extension { #name : #Symbol }

{ #category : #'*Alkalin-Di' }
Symbol >> asUnary [
	self isUnary ifTrue: [ ^ self ].
	^ (self copyReplaceAll: ':' with: '') asSymbol
]
