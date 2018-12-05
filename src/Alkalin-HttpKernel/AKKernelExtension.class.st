"
I am the base class for Extension.
My subclasses are used to make some processes after the configuration is completed.

To be registered, extensions have to be declared using KernelConfig>>extensions.
Registred extensions are executed at the end of the configuration process.


"
Class {
	#name : #AKKernelExtension,
	#superclass : #Object,
	#category : #'Alkalin-HttpKernel-Extension'
}

{ #category : #configuring }
AKKernelExtension class >> priority [
	^ 100
]

{ #category : #loading }
AKKernelExtension >> load: aDiContainer config: aConfiguration [
	self subclassResponsibility
]
