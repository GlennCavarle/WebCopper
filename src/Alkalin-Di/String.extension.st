Extension { #name : #String }

{ #category : #'*Alkalin-Di' }
String >> asAKServiceRef [
	^ AKDiServiceReference identifier: self asSymbol
]
