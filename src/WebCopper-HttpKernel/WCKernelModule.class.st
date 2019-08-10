"
I am the abstract class for module definition.

A module is kind of plugin which provides new features and features integration for the Alkalin Framework.
To be registered, modules have to be declared using KernelConfig>>modules.
"
Class {
	#name : #WCKernelModule,
	#superclass : #Object,
	#instVars : [
		'configuration'
	],
	#category : #'WebCopper-HttpKernel-Module'
}

{ #category : #configuring }
WCKernelModule class >> defaultConfiguration [
	^ WCKernelModuleConfig new
]

{ #category : #configuring }
WCKernelModule class >> priority [
	^ 100
]

{ #category : #accessing }
WCKernelModule >> configuration [
	^ configuration ifNil: [ configuration := self class defaultConfiguration ]
]

{ #category : #'instance creation' }
WCKernelModule >> load: aDiContainer config: aConfig [
]

{ #category : #'instance creation' }
WCKernelModule >> send: aSelector on: aReceiver with: anArgument [

	(aReceiver respondsTo: aSelector)
		ifTrue: [ aReceiver perform: aSelector with: anArgument ]
]
