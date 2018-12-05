"
I am an Extension.

I search Event Listeners  defined in the ServiceContainer based on the EventListenerTag.
I register found Listeners into the EventDispatcher.
"
Class {
	#name : #AKRegisterTaggedListenersExtension,
	#superclass : #AKKernelExtension,
	#category : #'Alkalin-HttpKernel-Extension'
}

{ #category : #accessing }
AKRegisterTaggedListenersExtension class >> priority [
	^ 1000
]

{ #category : #loading }
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
