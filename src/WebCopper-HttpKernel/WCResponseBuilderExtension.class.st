Class {
	#name : #WCResponseBuilderExtension,
	#superclass : #WCKernelExtension,
	#category : #'WebCopper-HttpKernel-Extension'
}

{ #category : #loading }
WCResponseBuilderExtension >> load: aDiContainer config: aConfiguration [
	
	aDiContainer addDefinition:[:def| def
		identifier: #ResponseBuilderSubscriber;
		targetClass: WCResponseBuilderSubscriber;
		tag: (WCDiTag name:#eventSubscriber)]
	
]
