Class {
	#name : #WCSecurityModule,
	#superclass : #WCKernelModule,
	#category : #'WebCopperModule-Security-Module'
}

{ #category : #configuring }
WCSecurityModule class >> defaultConfiguration [
	^ WCSecurityModuleConfig new
]

{ #category : #configuring }
WCSecurityModule >> configureEventListeners: anEventDispatcher [
	| map |
	self configuration isConfigured ifFalse: [ ^ self ].
	map := self configuration buildAuthenticatorMap.
	anEventDispatcher addSubscriber: (WCSecuritySubscriber withAuthenticatorMap: map)
]

{ #category : #configuring }
WCSecurityModule >> configureServiceContainer: aDiContainer [

	aDiContainer 
		addDefinition: [ :def|def 
			identifier: #AuthorizationService;
			targetClass: WCAuthorizationService]
]

{ #category : #configuring }
WCSecurityModule >> load: aDiContainer config: aKernelConfig [

	self send: #configureSecurity: on: aKernelConfig with: self configuration.
	
	self configureServiceContainer: aDiContainer.
	self configureEventListeners: (aDiContainer get: #EventDispatcher)
]
