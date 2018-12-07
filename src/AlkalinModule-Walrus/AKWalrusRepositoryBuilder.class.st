Class {
	#name : #AKWalrusRepositoryBuilder,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'repositoryClass',
		'modelClass',
		'dbContext',
		'isWithDefaultContext'
	],
	#category : #'AlkalinModule-Walrus-Builder'
}

{ #category : #'private - building' }
AKWalrusRepositoryBuilder >> buildDefinitionsOn: aDiContainer [
	|cxtId|
	cxtId := self dbContextIdFrom: aDiContainer.
	aDiContainer
		addDefinition:[:def| def
			identifier: self identifier;
			targetClass: self repositoryClass;
			constructor: #context:modelClass: withArgs: {cxtId asAKServiceRef. self modelClass}]
	
]

{ #category : #accessing }
AKWalrusRepositoryBuilder >> dbContext [
	^ dbContext ifNil: [ Error signal: 'Db Context identifier must be defined' ]
]

{ #category : #api }
AKWalrusRepositoryBuilder >> dbContext: aDbContextId [
	isWithDefaultContext := false.
	dbContext := aDbContextId
]

{ #category : #'private - building' }
AKWalrusRepositoryBuilder >> dbContextIdFrom: aDiContainer [
	| dbContextServices |
	self isWithDefaultContext ifFalse: [ ^ self dbContext ].
	dbContextServices := aDiContainer servicesWithTag: #wrDbContext.
	dbContextServices ifEmpty: [ Error signal: 'No Walrus DbContext is registered' ].
	^ dbContextServices values first identifier
]

{ #category : #accessing }
AKWalrusRepositoryBuilder >> identifier [
	^ identifier ifNil: [ Error signal: 'Repository identifier must be defined' ]
]

{ #category : #api }
AKWalrusRepositoryBuilder >> identifier: aRepositoryId [
	identifier := aRepositoryId
]

{ #category : #initialization }
AKWalrusRepositoryBuilder >> initialize [
	super initialize.
	isWithDefaultContext := true.
]

{ #category : #accessing }
AKWalrusRepositoryBuilder >> isWithDefaultContext [
	^ isWithDefaultContext
]

{ #category : #api }
AKWalrusRepositoryBuilder >> model: aModelClass [
	modelClass := aModelClass
]

{ #category : #accessing }
AKWalrusRepositoryBuilder >> modelClass [
	^ modelClass ifNil: [ Error signal: 'model class must be defined' ]
]

{ #category : #api }
AKWalrusRepositoryBuilder >> repository: aRepositoryClass [
	repositoryClass := aRepositoryClass
]

{ #category : #accessing }
AKWalrusRepositoryBuilder >> repositoryClass [
	^ repositoryClass ifNil: [ repositoryClass := WRGenericRepository ]
]
