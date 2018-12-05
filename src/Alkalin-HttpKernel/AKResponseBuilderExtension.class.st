Class {
	#name : #AKResponseBuilderExtension,
	#superclass : #AKKernelExtension,
	#category : #'Alkalin-HttpKernel-Extension'
}

{ #category : #loading }
AKResponseBuilderExtension >> load: aDiContainer config: aConfiguration [
	
	aDiContainer addDefinition:[:def| def
		identifier: #ResponseBuilderSubscriber;
		targetClass: AKResponseBuilderSubscriber;
		tag: (AKDiTag name:#eventSubscriber)]
	
]
