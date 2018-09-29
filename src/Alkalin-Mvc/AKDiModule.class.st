Class {
	#name : #AKDiModule,
	#superclass : #AKMvcModule,
	#category : #'Alkalin-Mvc-Module'
}

{ #category : #'instance creation' }
AKDiModule >> load: aDiContainer config: aConfig [
	self
		send: #configureServiceContainer:
		on: aConfig
		with: aDiContainer
]
