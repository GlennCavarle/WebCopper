Class {
	#name : #WCKernelMockConfig,
	#superclass : #WCKernelConfig,
	#instVars : [
		'testBlocks',
		'extensions',
		'modules'
	],
	#category : #'WebCopper-HttpKernel-Testing'
}

{ #category : #'main configuration' }
WCKernelMockConfig >> configureEventListeners: aAKEventDispatcher [
	self test: #configureEventListeners: arg: aAKEventDispatcher
]

{ #category : #'main configuration' }
WCKernelMockConfig >> configureRouter: aAKRouter [
	self test: #configureRouter: arg: aAKRouter
]

{ #category : #'main configuration' }
WCKernelMockConfig >> configureServiceContainer: aAKServiceContainer [
	self test: #configureServiceContainer: arg: aAKServiceContainer
]

{ #category : #accessing }
WCKernelMockConfig >> extensions [
	^ extensions
]

{ #category : #accessing }
WCKernelMockConfig >> extensions: anObject [
	extensions := anObject
]

{ #category : #initialization }
WCKernelMockConfig >> initialize [
	super initialize.
	testBlocks := Dictionary new.
	extensions := {  }.
	modules := {  }.
]

{ #category : #accessing }
WCKernelMockConfig >> modules [
	^ modules
]

{ #category : #accessing }
WCKernelMockConfig >> modules: anObject [
	modules := anObject
]

{ #category : #testing }
WCKernelMockConfig >> spy: aSelector with: aTestBlock [ 
	testBlocks at: aSelector put: aTestBlock
]

{ #category : #private }
WCKernelMockConfig >> test: aSelector arg: anArgument [
	testBlocks at: aSelector ifPresent: [ :aTestBlock | aTestBlock value: anArgument ]
]
