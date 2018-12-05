Class {
	#name : #AKSecurityModuleTest,
	#superclass : #TestCase,
	#category : #'AlkalinModule-Security-Tests'
}

{ #category : #tests }
AKSecurityModuleTest >> buildMockConfigWithSpy: aTestBlock [
	| kConf |
	
	kConf := AKKernelMockConfig new.
	kConf modules: {AKSecurityModule new}.
	kConf spy: #configureSecurity: with: aTestBlock.
	
	^ kConf
]

{ #category : #tests }
AKSecurityModuleTest >> configureDummySecurity: aSecurityConf [
	aSecurityConf
		addAuthenticator: [ :authBuilder | authBuilder
				urlRegex: '^/.*';
				authenticatorClass: #AKBasicAuthenticator ]
]

{ #category : #tests }
AKSecurityModuleTest >> testAuthorizationServiceShouldBeRegistered [
	| kConf k |
	
	kConf := self buildMockConfigWithSpy: [:aSecurityConf| 
		self configureDummySecurity: aSecurityConf].
	
	k := AKKernel withConfiguration: kConf.
	self assert: (k serviceContainer has: #AuthorizationService).
		
	
]

{ #category : #tests }
AKSecurityModuleTest >> testConfigurationMethodShouldBeCalled [
	| kConf k isCalled |
	isCalled := false.
	
	
	kConf := self buildMockConfigWithSpy: [:aSecurityConf| 
		self configureDummySecurity: aSecurityConf.
		isCalled := true].
	
	k := AKKernel withConfiguration: kConf.
	
	self assert: isCalled 
		
	
]

{ #category : #tests }
AKSecurityModuleTest >> testSubscriberShouldBeRegisteredOnlyIfSecurityIsConfigured [
		| kConf1 kConf2 k isConfigured|
	
	
	isConfigured  := false.
	kConf1 := self buildMockConfigWithSpy: [:aSecurityConf|
		isConfigured := aSecurityConf isConfigured].
	k := AKKernel withConfiguration: kConf1.
	
	self  assert: (isConfigured not and: [ (k eventDispatcher hasSubscriber: AKSecuritySubscriber new) not ]).
	
	isConfigured  := false.
	kConf2 := self buildMockConfigWithSpy: [:aSecurityConf|
		self configureDummySecurity: aSecurityConf.
		isConfigured := aSecurityConf isConfigured].
	k := AKKernel withConfiguration: kConf2.
	
	self  assert: (isConfigured and: [ k eventDispatcher hasSubscriber: AKSecuritySubscriber new ]).
	
		
		
	
]
