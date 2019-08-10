Class {
	#name : #WCWalrusRepositoryBuilder,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'repositoryClass',
		'modelClass',
		'dbContext',
		'isWithDefaultContext'
	],
	#category : #'WebCopperModule-Walrus-Builder'
}

{ #category : #'private - building' }
WCWalrusRepositoryBuilder >> buildDefinitionsOn: aDiContainer [
	|cxtId|
	cxtId := self dbContextIdFrom: aDiContainer.
	aDiContainer
		addDefinition:[:def| def
			identifier: self identifier;
			targetClass: self repositoryClass;
			constructor: #context:modelClass: withArgs: {cxtId asWCServiceRef. self modelClass}]
	
]

{ #category : #accessing }
WCWalrusRepositoryBuilder >> dbContext [
	^ dbContext ifNil: [ Error signal: 'Db Context identifier must be defined' ]
]

{ #category : #api }
WCWalrusRepositoryBuilder >> dbContext: aDbContextId [
	isWithDefaultContext := false.
	dbContext := aDbContextId
]

{ #category : #'private - building' }
WCWalrusRepositoryBuilder >> dbContextIdFrom: aDiContainer [
	| dbContextServices |
	self isWithDefaultContext ifFalse: [ ^ self dbContext ].
	dbContextServices := aDiContainer servicesWithTag: #wrDbContext.
	dbContextServices ifEmpty: [ Error signal: 'No Walrus DbContext is registered' ].
	^ dbContextServices values first identifier
]

{ #category : #accessing }
WCWalrusRepositoryBuilder >> identifier [
	^ identifier ifNil: [ Error signal: 'Repository identifier must be defined' ]
]

{ #category : #api }
WCWalrusRepositoryBuilder >> identifier: aRepositoryId [
	identifier := aRepositoryId
]

{ #category : #initialization }
WCWalrusRepositoryBuilder >> initialize [
	super initialize.
	isWithDefaultContext := true.
]

{ #category : #accessing }
WCWalrusRepositoryBuilder >> isWithDefaultContext [
	^ isWithDefaultContext
]

{ #category : #api }
WCWalrusRepositoryBuilder >> model: aModelClass [
	modelClass := aModelClass
]

{ #category : #accessing }
WCWalrusRepositoryBuilder >> modelClass [
	^ modelClass ifNil: [ Error signal: 'model class must be defined' ]
]

{ #category : #api }
WCWalrusRepositoryBuilder >> repository: aRepositoryClass [
	repositoryClass := aRepositoryClass
]

{ #category : #accessing }
WCWalrusRepositoryBuilder >> repositoryClass [
	^ repositoryClass ifNil: [ repositoryClass := WRGenericRepository ]
]
