Class {
	#name : #AKScaffolding,
	#superclass : #Object,
	#category : #'AlkalinTool-Scaffolding'
}

{ #category : #tests }
AKScaffolding >> idea [
AKScaffolding project
	create: #'MyProject' with:[:spec| spec 
			package:'MyProject' tags:#( #App #Controller #Model);
			kernelTag:#App].

AKScaffolding module 
	install:#( #AKSecurityModule #AKWalrusModule ) 
	into:#'MyProject'.

AKScaffolding extension
	install:#( #AKActionResolverExtension #AKRegisterTaggedListenersExtension ) 
	into:#'MyProject'.
	
AKScaffolding controller 
	create:#DefaultController into: #'MyProject::Controller'
]
