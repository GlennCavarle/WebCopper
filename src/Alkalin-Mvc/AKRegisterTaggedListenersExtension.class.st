Class {
	#name : #AKRegisterTaggedListenersExtension,
	#superclass : #AKMvcExtension,
	#category : #'Alkalin-Mvc-Extension'
}

{ #category : #'as yet unclassified' }
AKRegisterTaggedListenersExtension >> load: aDiContainer config: aConfiguration [
	|eventDispatcher|
	
	eventDispatcher := aDiContainer get:#EventDispatcher.
	
	aDiContainer servicesWithTag: #eventSubscriber
		do: [ :each :tag | eventDispatcher 
			addSubscriber: each ].
	
	aDiContainer servicesWithTag: #eventListener
		do: [ :each :tag | eventDispatcher
			addListener: each eventClass: tag eventClass priority: tag priority ]
]
