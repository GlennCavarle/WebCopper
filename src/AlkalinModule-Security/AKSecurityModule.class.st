Class {
	#name : #AKSecurityModule,
	#superclass : #AKKernelModule,
	#category : #'AlkalinModule-Security-Module'
}

{ #category : #configuring }
AKSecurityModule class >> defaultConfiguration [
	^ AKSecurityModuleConfig new
]

{ #category : #'instance creation' }
AKSecurityModule >> configureEventListeners: anEventDispatcher [
	| map |
	self configuration isConfigured ifFalse: [ ^ self ].
	map := self configuration buildAuthenticatorMap.
	anEventDispatcher addSubscriber: (AKSecuritySubscriber withAuthenticatorMap: map)
]

{ #category : #'instance creation' }
AKSecurityModule >> configureServiceContainer: aDiContainer [

	aDiContainer 
		addDefinition: [ :def|def 
			identifier: #AuthorizationService;
			targetClass: AKAuthorizationService]
]

{ #category : #'instance creation' }
AKSecurityModule >> load: aDiContainer config: aKernelConfig [

	self send: #configureSecurity: on: aKernelConfig with: self configuration.
	
	self configureServiceContainer: aDiContainer.
	self configureEventListeners: (aDiContainer get: #EventDispatcher)
]
