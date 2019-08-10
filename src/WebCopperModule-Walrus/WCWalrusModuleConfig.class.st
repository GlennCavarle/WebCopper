Class {
	#name : #WCWalrusModuleConfig,
	#superclass : #WCKernelModuleConfig,
	#instVars : [
		'metadataFactory',
		'contexts',
		'repositories'
	],
	#category : #'WebCopperModule-Walrus-Module'
}

{ #category : #adding }
WCWalrusModuleConfig >> addContext: aBlock [
	| cxtBuilder |
	cxtBuilder := WCWalrusContextBuilder new.
	aBlock value: cxtBuilder.
	contexts at: cxtBuilder identifier put: cxtBuilder
]

{ #category : #adding }
WCWalrusModuleConfig >> addRepository: aBlock [
	| repoBuilder |
	repoBuilder := WCWalrusRepositoryBuilder new.
	aBlock value: repoBuilder.
	repositories at: repoBuilder identifier put: repoBuilder
]

{ #category : #'private - accessing' }
WCWalrusModuleConfig >> contexts [
	^ contexts values
]

{ #category : #initialization }
WCWalrusModuleConfig >> initialize [
	super initialize.
	contexts := Dictionary new.
	repositories := Dictionary new.
]

{ #category : #'private - accessing' }
WCWalrusModuleConfig >> repositories [
	^ repositories values
]
