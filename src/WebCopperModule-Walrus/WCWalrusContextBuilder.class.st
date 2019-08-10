Class {
	#name : #WCWalrusContextBuilder,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'connectionConfig',
		'metadataFactory'
	],
	#category : #'WebCopperModule-Walrus-Builder'
}

{ #category : #'private - building' }
WCWalrusContextBuilder >> buildDefinitionsOn: aDiContainer [
	| conPoolId |
	conPoolId := (self identifier,'ConnectionPool') asSymbol.
	
	aDiContainer
		addDefinition:[:def| def
			identifier: self identifier;
			targetClass: WRDbContext;
			constructor: #metadataFactory:connection: withArgs: { 
				self metadataFactory. conPoolId asWCServiceRef};
			tag: (WCDiTag name: #wrDbContext)];
						
		addDefinition:[:def| def
			identifier: conPoolId;
			targetClass: WRConnectionPool ;
			constructor: #config: withArgs: { connectionConfig};
			tag: (WCDiTag name: #wrConnectionPool) ]
]

{ #category : #api }
WCWalrusContextBuilder >> database: aDbName [
	connectionConfig database: aDbName
]

{ #category : #api }
WCWalrusContextBuilder >> host: anHost port: aPort [
	connectionConfig host: anHost port: aPort
]

{ #category : #accessing }
WCWalrusContextBuilder >> identifier [
	^ identifier ifNil: [ Error signal: 'Db context identifier must be defined' ]
]

{ #category : #api }
WCWalrusContextBuilder >> identifier: anIdentifier [
	identifier := anIdentifier
]

{ #category : #initialization }
WCWalrusContextBuilder >> initialize [
	super initialize.
	connectionConfig := WRConnectionConfig new.
]

{ #category : #api }
WCWalrusContextBuilder >> maxPoolSize: anInteger [
	connectionConfig maxPoolSize: anInteger
]

{ #category : #accessing }
WCWalrusContextBuilder >> metadataFactory [
	^ metadataFactory ifNil: [ metadataFactory := WRClassMetadataFactory withAnnotationLoader ]
]

{ #category : #api }
WCWalrusContextBuilder >> metadataFactory: aMetadataFactory [
	metadataFactory := aMetadataFactory
]

{ #category : #api }
WCWalrusContextBuilder >> username: anUsername password: aPwd [
	connectionConfig username: anUsername password: aPwd
]
