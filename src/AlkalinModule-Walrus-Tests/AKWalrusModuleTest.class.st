Class {
	#name : #AKWalrusModuleTest,
	#superclass : #TestCase,
	#category : #'AlkalinModule-Walrus-Tests'
}

{ #category : #tests }
AKWalrusModuleTest >> buildMockConfigWithSpy: aTestBlock [
	| kConf |
	
	kConf := AKKernelMockConfig new.
	kConf modules: {AKWalrusModule new}.
	kConf spy: #configureWalrus: with: aTestBlock.
	
	^ kConf
]

{ #category : #tests }
AKWalrusModuleTest >> configureDummyWalrus: aWalrusConf [
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
AKWalrusModuleTest >> testConfigurationMethodShouldBeCalled [
	| kConf k isCalled |
	
	kConf := self buildMockConfigWithSpy: [:aWalrusConf| 
		self configureDummyWalrus: aWalrusConf.
		isCalled := true].
	
	k := AKKernel withConfiguration: kConf.
	
	self assert: isCalled 
	
]

{ #category : #tests }
AKWalrusModuleTest >> testServicesShouldBeRegistered [
	| kConf k |
	
	kConf := self buildMockConfigWithSpy: [:aWalrusConf| 
		self configureDummyWalrus: aWalrusConf].
	
	k := AKKernel withConfiguration: kConf.
	self assert: (k serviceContainer has: #ContextOne).
	self assert: (k serviceContainer has: #ContextOneConnectionPool).
	self assert: (k serviceContainer has: #MyRepo).
	
	k serviceContainer get: #MyRepo
	
]

{ #category : #tests }
AKWalrusModuleTest >> testServicesShouldBeWellCreated [
	| kConf k |
	
	kConf := self buildMockConfigWithSpy: [:aWalrusConf| 
		self configureDummyWalrus: aWalrusConf].
	
	k := AKKernel withConfiguration: kConf.
	self assert: ((k serviceContainer get: #MyRepo) isKindOf: WRGenericRepository).
	self assert: ((k serviceContainer get: #MyOtherRepo) isKindOf: WRGenericRepository).
	self assert: ((k serviceContainer get: #ContextOne) isKindOf: WRDbContext).
	self assert: ((k serviceContainer get: #ContextOneConnectionPool) isKindOf: WRConnectionPool ).
	
	
	
]
