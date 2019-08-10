Class {
	#name : #WCActionResolverExtension,
	#superclass : #WCKernelExtension,
	#category : #'WebCopper-HttpKernel-Extension'
}

{ #category : #loading }
WCActionResolverExtension >> load: aDiContainer config: aConfiguration [
	
	aDiContainer addDefinition:[:def| def
		identifier: #ActionResolverSubscriber;
		targetClass: WCActionResolverSubscriber;
		constructor: #serviceContainer: withArgs: { #ServiceContainer asWCServiceRef };
		tag: (WCDiTag name:#eventSubscriber)]
	
]
