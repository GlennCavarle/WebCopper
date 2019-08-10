Class {
	#name : #WCScaffolding,
	#superclass : #Object,
	#category : #'WebCopperTool-Scaffolding'
}

{ #category : #tests }
WCScaffolding >> idea [
WCScaffolding project
	create: #'MyProject' with:[:spec| spec 
			package:'MyProject' tags:#( #App #Controller #Model);
			kernelTag:#App].

WCScaffolding module 
	install:#( #WCSecurityModule #WCWalrusModule ) 
	into:#'MyProject'.

WCScaffolding extension
	install:#( #WCActionResolverExtension #WCRegisterTaggedListenersExtension ) 
	into:#'MyProject'.
	
WCScaffolding controller 
	create:#DefaultController into: #'MyProject::Controller'
]
