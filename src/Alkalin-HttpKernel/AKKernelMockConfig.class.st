Class {
	#name : #AKKernelMockConfig,
	#superclass : #AKKernelConfig,
	#instVars : [
		'testBlocks',
		'extensions',
		'modules'
	],
	#category : #'Alkalin-HttpKernel-Testing'
}

{ #category : #'main configuration' }
AKKernelMockConfig >> configureEventListeners: aAKEventDispatcher [
	self test: #configureEventListeners: arg: aAKEventDispatcher
]

{ #category : #'main configuration' }
AKKernelMockConfig >> configureRouter: aAKRouter [
	self test: #configureRouter: arg: aAKRouter
]

{ #category : #'main configuration' }
AKKernelMockConfig >> configureServiceContainer: aAKServiceContainer [
	self test: #configureServiceContainer: arg: aAKServiceContainer
]

{ #category : #accessing }
AKKernelMockConfig >> extensions [
	^ extensions
]

{ #category : #accessing }
AKKernelMockConfig >> extensions: anObject [
	extensions := anObject
]

{ #category : #initialization }
AKKernelMockConfig >> initialize [
	super initialize.
	testBlocks := Dictionary new.
	extensions := {  }.
	modules := {  }.
]

{ #category : #accessing }
AKKernelMockConfig >> modules [
	^ modules
]

{ #category : #accessing }
AKKernelMockConfig >> modules: anObject [
	modules := anObject
]

{ #category : #testing }
AKKernelMockConfig >> spy: aSelector with: aTestBlock [ 
	testBlocks at: aSelector put: aTestBlock
]

{ #category : #private }
AKKernelMockConfig >> test: aSelector arg: anArgument [
	testBlocks at: aSelector ifPresent: [ :aTestBlock | aTestBlock value: anArgument ]
]
