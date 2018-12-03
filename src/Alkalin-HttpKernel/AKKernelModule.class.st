"
I am the abstract class for module definition.

A module is kind of plugin which provides new features and features integration for the Alkalin Framework.
To be registered, modules have to be declared using KernelConfig>>modules.
"
Class {
	#name : #AKKernelModule,
	#superclass : #Object,
	#instVars : [
		'configuration'
	],
	#category : #'Alkalin-HttpKernel-Module'
}

{ #category : #configuring }
AKKernelModule class >> defaultConfiguration [
	^ AKKernelModuleConfig new
]

{ #category : #accessing }
AKKernelModule >> configuration [
	^ configuration ifNil: [ configuration := self class defaultConfiguration ]
]

{ #category : #'instance creation' }
AKKernelModule >> load: aDiContainer config: aConfig [
]

{ #category : #'instance creation' }
AKKernelModule >> send: aSelector on: aReceiver with: anArgument [

	(aReceiver respondsTo: aSelector)
		ifTrue: [ aReceiver perform: aSelector with: anArgument ]
]
