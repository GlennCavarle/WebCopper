Class {
	#name : #WCWalrusModuleTest,
	#superclass : #TestCase,
	#category : #'WebCopperModule-Walrus-Tests'
}

{ #category : #tests }
WCWalrusModuleTest >> buildMockConfigWithSpy: aTestBlock [
	| kConf |
	
	kConf := WCKernelMockConfig new.
	kConf modules: {WCWalrusModule new}.
	kConf spy: #configureWalrus: with: aTestBlock.
	
	^ kConf
]

{ #category : #tests }
WCWalrusModuleTest >> configureDummyWalrus: aWalrusConf [
	aWalrusConf

		addContext:[:aCxtBuilder| aCxtBuilder
			identifier: #ContextOne;
			host: '172.17.0.2' port: 27017;
			database: 'test-db';
			metadataFactory: WRClassMetadataFactory withClassMethodLoader];
		
		addRepository:[:aRepoBuilder| aRepoBuilder
			identifier: #MyRepo;
			repository: WRGenericRepository;
			model: WRTestObject ];
		
		addRepository:[:aRepoBuilder| aRepoBuilder
			identifier: #MyOtherRepo;
			repository: WRGenericRepository;
			model: WRTestObject;
			dbContext: #ContextOne ]
]

{ #category : #tests }
WCWalrusModuleTest >> testConfigurationMethodShouldBeCalled [
	| kConf k isCalled |
	
	kConf := self buildMockConfigWithSpy: [:aWalrusConf| 
		self configureDummyWalrus: aWalrusConf.
		isCalled := true].
	
	k := WCKernel withConfiguration: kConf.
	
	self assert: isCalled 
	
]

{ #category : #tests }
WCWalrusModuleTest >> testServicesShouldBeRegistered [
	| kConf k |
	
	kConf := self buildMockConfigWithSpy: [:aWalrusConf| 
		self configureDummyWalrus: aWalrusConf].
	
	k := WCKernel withConfiguration: kConf.
	self assert: (k serviceContainer has: #ContextOne).
	self assert: (k serviceContainer has: #ContextOneConnectionPool).
	self assert: (k serviceContainer has: #MyRepo).
	
	k serviceContainer get: #MyRepo
	
]

{ #category : #tests }
WCWalrusModuleTest >> testServicesShouldBeWellCreated [
	| kConf k |
	
	kConf := self buildMockConfigWithSpy: [:aWalrusConf| 
		self configureDummyWalrus: aWalrusConf].
	
	k := WCKernel withConfiguration: kConf.
	self assert: ((k serviceContainer get: #MyRepo) isKindOf: WRGenericRepository).
	self assert: ((k serviceContainer get: #MyOtherRepo) isKindOf: WRGenericRepository).
	self assert: ((k serviceContainer get: #ContextOne) isKindOf: WRDbContext).
	self assert: ((k serviceContainer get: #ContextOneConnectionPool) isKindOf: WRConnectionPool ).
	
	
	
]
