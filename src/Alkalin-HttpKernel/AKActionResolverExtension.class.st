Class {
	#name : #AKActionResolverExtension,
	#superclass : #AKKernelExtension,
	#category : #'Alkalin-HttpKernel-Extension'
}

{ #category : #loading }
AKActionResolverExtension >> load: aDiContainer config: aConfiguration [
	
	aDiContainer addDefinition:[:def| def
		identifier: #ActionResolverSubscriber;
		targetClass: AKActionResolverSubscriber;
		constructor: #serviceContainer: withArgs: { #ServiceContainer asAKServiceRef };
		tag: (AKDiTag name:#eventSubscriber)]
	
]
