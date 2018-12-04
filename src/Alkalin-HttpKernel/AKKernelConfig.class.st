Class {
	#name : #AKKernelConfig,
	#superclass : #Object,
	#instVars : [
		'parameters'
	],
	#category : #'Alkalin-HttpKernel-Kernel'
}

{ #category : #'kernel creation' }
AKKernelConfig class >> createKernel [
	^ self createKernelForEnv: AKGlobalSettings appEnv
]

{ #category : #'kernel creation' }
AKKernelConfig class >> createKernelForEnv: aSymbol [
	^ AKKernel withConfiguration: (self perform: aSymbol)
]

{ #category : #'app env' }
AKKernelConfig class >> dev [
	^ self new
]

{ #category : #'app env' }
AKKernelConfig class >> prod [
	^ self new
]

{ #category : #'app env' }
AKKernelConfig class >> test [
	^ self new
]

{ #category : #'main configuration' }
AKKernelConfig >> configureEventListeners: aAKEventDispatcher [
	
]

{ #category : #'main configuration' }
AKKernelConfig >> configureRouter: aAKRouter [
]

{ #category : #'main configuration' }
AKKernelConfig >> configureServiceContainer: aAKServiceContainer [
]

{ #category : #accessing }
AKKernelConfig >> extensions [
	^ {}
]

{ #category : #accessing }
AKKernelConfig >> modules [
	^ {}
]
