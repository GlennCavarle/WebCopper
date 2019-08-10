Extension { #name : #SequenceableCollection }

{ #category : #'*WebCopper-HttpRouter' }
SequenceableCollection >> isEmptyOrBeginsWith: aSequenceableCollection [
	aSequenceableCollection isEmpty ifTrue:[^ true].
	^ self beginsWith: aSequenceableCollection
]
