Class {
	#name : #WCSecurityModuleTest,
	#superclass : #TestCase,
	#category : #'WebCopperModule-Security-Tests'
}

{ #category : #tests }
WCSecurityModuleTest >> buildMockConfigWithSpy: aTestBlock [
	| kConf |
	
	kConf := WCKernelMockConfig new.
	kConf modules: {WCSecurityModule new}.
	kConf spy: #configureSecurity: with: aTestBlock.
	
	^ kConf
]

{ #category : #tests }
WCSecurityModuleTest >> configureDummySecurity: aSecurityConf [
	aSecurityConf
		addAuthenticator: [ :authBuilder | authBuilder
				urlRegex: '^/.*';
				authenticatorClass: #WCBasicAuthenticator ]
]

{ #category : #tests }
WCSecurityModuleTest >> testAuthorizationServiceShouldBeRegistered [
	| kConf k |
	
	kConf := self buildMockConfigWithSpy: [:aSecurityConf| 
		self configureDummySecurity: aSecurityConf].
	
	k := WCKernel withConfiguration: kConf.
	self assert: (k serviceContainer has: #AuthorizationService).
		
	
]

{ #category : #tests }
WCSecurityModuleTest >> testConfigurationMethodShouldBeCalled [
	| kConf k isCalled |
	isCalled := false.
	
	
	kConf := self buildMockConfigWithSpy: [:aSecurityConf| 
		self configureDummySecurity: aSecurityConf.
		isCalled := true].
	
	k := WCKernel withConfiguration: kConf.
	
	self assert: isCalled 
		
	
]

{ #category : #tests }
WCSecurityModuleTest >> testSubscriberShouldBeRegisteredOnlyIfSecurityIsConfigured [
		| kConf1 kConf2 k isConfigured|
	
	
	isConfigured  := false.
	kConf1 := self buildMockConfigWithSpy: [:aSecurityConf|
		isConfigured := aSecurityConf isConfigured].
	k := WCKernel withConfiguration: kConf1.
	
	self  assert: (isConfigured not and: [ (k eventDispatcher hasSubscriber: WCSecuritySubscriber new) not ]).
	
	isConfigured  := false.
	kConf2 := self buildMockConfigWithSpy: [:aSecurityConf|
		self configureDummySecurity: aSecurityConf.
		isConfigured := aSecurityConf isConfigured].
	k := WCKernel withConfiguration: kConf2.
	
	self  assert: (isConfigured and: [ k eventDispatcher hasSubscriber: WCSecuritySubscriber new ]).
	
		
		
	
]
