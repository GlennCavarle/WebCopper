Class {
	#name : #AKMvcModule,
	#superclass : #Object,
	#category : #'Alkalin-Mvc-Module'
}

{ #category : #'instance creation' }
AKMvcModule >> load: aDiContainer config: aConfig [
]

{ #category : #'instance creation' }
AKMvcModule >> send: aSelector on: aReceiver with: anArgument [

	(aReceiver respondsTo: aSelector)
		ifTrue: [ aReceiver perform: aSelector with: anArgument ]
]
