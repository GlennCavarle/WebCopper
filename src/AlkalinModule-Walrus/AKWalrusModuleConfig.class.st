Class {
	#name : #AKWalrusModuleConfig,
	#superclass : #AKKernelModuleConfig,
	#instVars : [
		'metadataFactory',
		'contexts',
		'repositories'
	],
	#category : #'AlkalinModule-Walrus-Module'
}

{ #category : #adding }
AKWalrusModuleConfig >> addContext: aBlock [
	| cxtBuilder |
	cxtBuilder := AKWalrusContextBuilder new.
	aBlock value: cxtBuilder.
	contexts at: cxtBuilder identifier put: cxtBuilder
]

{ #category : #adding }
AKWalrusModuleConfig >> addRepository: aBlock [
	| repoBuilder |
	repoBuilder := AKWalrusRepositoryBuilder new.
	aBlock value: repoBuilder.
	repositories at: repoBuilder identifier put: repoBuilder
]

{ #category : #'private - accessing' }
AKWalrusModuleConfig >> contexts [
	^ contexts values
]

{ #category : #initialization }
AKWalrusModuleConfig >> initialize [
	super initialize.
	contexts := Dictionary new.
	repositories := Dictionary new.
]

{ #category : #'private - accessing' }
AKWalrusModuleConfig >> repositories [
	^ repositories values
]
