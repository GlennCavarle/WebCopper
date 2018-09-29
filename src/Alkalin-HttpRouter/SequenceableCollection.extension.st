Extension { #name : #SequenceableCollection }

{ #category : #'*Alkalin-HttpRouter' }
SequenceableCollection >> isEmptyOrBeginsWith: aSequenceableCollection [
	aSequenceableCollection isEmpty ifTrue:[^ true].
	^ self beginsWith: aSequenceableCollection
]
