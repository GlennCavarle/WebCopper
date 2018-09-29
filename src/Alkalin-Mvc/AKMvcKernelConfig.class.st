Class {
	#name : #AKMvcKernelConfig,
	#superclass : #Object,
	#instVars : [
		'parameters'
	],
	#category : #'Alkalin-Mvc-Kernel'
}

{ #category : #'kernel creation' }
AKMvcKernelConfig class >> createKernel [
	^ self createKernelForEnv: AKGlobalSettings appEnv
]

{ #category : #'kernel creation' }
AKMvcKernelConfig class >> createKernelForEnv: aSymbol [
	^ AKMvcKernel withConfiguration: (self perform: aSymbol)
]

{ #category : #'app env' }
AKMvcKernelConfig class >> dev [
	^ self new
]

{ #category : #'app env' }
AKMvcKernelConfig class >> prod [
	^ self new
]

{ #category : #'app env' }
AKMvcKernelConfig class >> test [
	^ self new
]

{ #category : #configuring }
AKMvcKernelConfig >> configureEventListeners: aAKEventDispatcher [
	
]

{ #category : #configuring }
AKMvcKernelConfig >> configureRouter: aAKRouter [
]

{ #category : #configuring }
AKMvcKernelConfig >> configureServiceContainer: aAKServiceContainer [
]

{ #category : #accessing }
AKMvcKernelConfig >> extensions [
	^ { 
		AKRegisterTaggedListenersExtension new
	 }
]

{ #category : #accessing }
AKMvcKernelConfig >> modules [
	^ {}
]
