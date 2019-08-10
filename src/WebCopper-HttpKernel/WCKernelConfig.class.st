Class {
	#name : #WCKernelConfig,
	#superclass : #Object,
	#instVars : [
		'parameters'
	],
	#category : #'WebCopper-HttpKernel-Kernel'
}

{ #category : #'kernel creation' }
WCKernelConfig class >> createKernel [
	^ self createKernelForEnv: WCGlobalSettings appEnv
]

{ #category : #'kernel creation' }
WCKernelConfig class >> createKernelForEnv: aSymbol [
	^ WCKernel withConfiguration: (self perform: aSymbol)
]

{ #category : #'app env' }
WCKernelConfig class >> dev [
	^ self new
]

{ #category : #'app env' }
WCKernelConfig class >> prod [
	^ self new
]

{ #category : #'app env' }
WCKernelConfig class >> test [
	^ self new
]

{ #category : #'main configuration' }
WCKernelConfig >> configureEventListeners: aAKEventDispatcher [
	
]

{ #category : #'main configuration' }
WCKernelConfig >> configureRouter: aAKRouter [
]

{ #category : #'main configuration' }
WCKernelConfig >> configureServiceContainer: aAKServiceContainer [
]

{ #category : #accessing }
WCKernelConfig >> extensions [
	^ {}
]

{ #category : #accessing }
WCKernelConfig >> modules [
	^ {}
]
