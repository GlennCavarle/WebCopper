"
I am the base class for Extension.
My subclasses are used to make some processes after the configuration is completed.

To be registered, extensions have to be declared using KernelConfig>>extensions.
Registred extensions are executed at the end of the configuration process.


"
Class {
	#name : #WCKernelExtension,
	#superclass : #Object,
	#category : #'WebCopper-HttpKernel-Extension'
}

{ #category : #configuring }
WCKernelExtension class >> priority [
	^ 100
]

{ #category : #loading }
WCKernelExtension >> load: aDiContainer config: aConfiguration [
	self subclassResponsibility
]
