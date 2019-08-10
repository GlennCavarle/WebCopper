Extension { #name : #String }

{ #category : #'*WebCopper-Di' }
String >> asWCServiceRef [
	^ WCDiServiceReference identifier: self asSymbol
]
