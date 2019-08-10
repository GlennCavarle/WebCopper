Class {
	#name : #BaselineOfWebCopper,
	#superclass : #BaselineOf,
	#category : #BaselineOfWebCopper
}

{ #category : #dependencies }
BaselineOfWebCopper >> apical: spec [

	spec
		baseline: 'Apical' with: [ spec
		repository: 'github://GlennCavarle/Apical/src' ].
]

{ #category : #baselines }
BaselineOfWebCopper >> baseline: spec [
	<baseline>

	spec for: #common do: [
		
		self
			"neoJson: spec;"
			zincComponents: spec;
			apical: spec;
			walrus:spec.
		
		self 
			corePackages: spec;
			featurePackages: spec;
		 	modulePackages: spec;
		 	examplePackages: spec;
		 	extraPackages: spec;
		 	enventSourcingPackages: spec;
			toolPackages: spec.
			
		self 
			groups: spec;
			testGroups: spec
		
]
]

{ #category : #packages }
BaselineOfWebCopper >> corePackages: spec [
	
	spec 
	
		"Base packages"
		package: #'WebCopper-Core';
		package: #'WebCopper-EventDispatcher' with: [ spec requires: #(#'WebCopper-Core') ];
		package: #'WebCopper-Di' with: [ spec requires: #(#'WebCopper-Core') ];
		package: #'WebCopper-HttpMessage' with: [ spec requires: #(#'WebCopper-Core' #ZincHTTPComponents "#NeoJSON") ];
		package: #'WebCopper-HttpRouter' with: [ spec requires: #(#'WebCopper-HttpMessage') ];
		package: #'WebCopper-HttpServer' with: [ spec requires: #(#'WebCopper-HttpMessage') ];
		package: #'WebCopper-HttpKernel' with: [ spec requires: #(#'WebCopper-Di' #'WebCopper-EventDispatcher' #'WebCopper-HttpRouter') ];
		
		"Tests"
		package: #'WebCopper-EventDispatcher-Tests' with: [ spec requires: #(#'WebCopper-EventDispatcher') ];
		package: #'WebCopper-HttpRouter-Tests' with: [ spec requires: #(#'WebCopper-HttpRouter') ];
		package: #'WebCopper-Di-Tests' with: [ spec requires: #(#'WebCopper-Di') ];
		package: #'WebCopper-HttpServer-Tests' with: [ spec requires: #(#'WebCopper-HttpServer' #Apical) ];
		package: #'WebCopper-HttpKernel-Tests' with: [ spec requires: #(#'WebCopper-HttpKernel' #Apical) ]
		
		
]

{ #category : #packages }
BaselineOfWebCopper >> enventSourcingPackages: spec [
	
	spec 
	
		"event sourcing"
		package: #'WebCopper-Ubiq'  with: [ spec requires: #(#'WebCopper-HttpKernel') ];
		
		"Examples"
		package: #'WebCopperExample-ComplexApp'  with: [ spec requires: #(#'WebCopper-Ubiq') ];
		
		"Tests"
		package: #'WebCopper-Ubiq-Tests' with: [ spec requires: #(#'WebCopper-Ubiq') ]
			
]

{ #category : #packages }
BaselineOfWebCopper >> examplePackages: spec [
	
	spec 
		
		"Examples"
		package: #'WebCopperExample-TodoApp' with: [ 
			spec requires: #(#'WebCopper-HttpKernel' #'WebCopperModule-Security' 'WebCopper-Html' #Apical) ]
	
]

{ #category : #packages }
BaselineOfWebCopper >> extraPackages: spec [
	spec
			
		"Extra"
		package: #'WebCopper-Refactoring'
		
		"Tests"
		
		
]

{ #category : #packages }
BaselineOfWebCopper >> featurePackages: spec [
	
	spec 
	
		"Feature packages"
		package: #'WebCopper-Html';
		package: #'WebCopper-Authentication' with: [ spec requires: #(#'WebCopper-HttpMessage') ];
		package: #'WebCopper-OAuth2' with: [ spec requires: #(#'WebCopper-Authentication') ];
		
		"Tests"
		package: #'WebCopper-Html-Tests' with: [ spec requires: #(#'WebCopper-Html') ];
		package: #'WebCopper-Authentication-Tests' with: [ spec requires: #(#'WebCopper-Authentication') ]
		
		
]

{ #category : #groups }
BaselineOfWebCopper >> groups: spec [

	spec 
		group: 'Core' with: #(
			#'WebCopper-HttpKernel'
			#'WebCopper-HttpServer');
			
		group: 'SecurityModule' with: #(
			#'WebCopperModule-Security');
			
		group: 'WalrusModule' with: #(
			#'WebCopperModule-Walrus');
		
		group: 'TodoAppExample' with: #(
			#'WebCopperExample-TodoApp');
		
		group: 'default' with: #('Core')
]

{ #category : #packages }
BaselineOfWebCopper >> modulePackages: spec [
	spec
	
		"Modules"
		package: #'WebCopperModule-Security' with: [ spec requires: #(#'WebCopper-HttpKernel' #'WebCopper-Authentication') ];
		package: #'WebCopperModule-Walrus' with: [ spec requires: #(#'WebCopper-HttpKernel' #'Walrus') ];
		
		"Tests"
		package: #'WebCopperModule-Security-Tests' with: [ spec requires: #(#'WebCopperModule-Security') ];
		package: #'WebCopperModule-Walrus-Tests' with: [ spec requires: #(#'WebCopperModule-Walrus') ]

]

{ #category : #dependencies }
BaselineOfWebCopper >> neoJson: spec [
spec 
		baseline: 'NeoJSON' with: [ spec
		repository: 'github://svenvc/NeoJSON:master/repository' ]

]

{ #category : #groups }
BaselineOfWebCopper >> testGroups: spec [

	spec 
		
		group: 'CoreTests' with: #(
			#'WebCopper-EventDispatcher-Tests'
			#'WebCopper-HttpRouter-Tests'
			#'WebCopper-Di-Tests'
			#'WebCopper-HttpServer-Tests'
			#'WebCopper-HttpKernel-Tests');
		
		group: 'FeatureTests' with: #(
			#'WebCopper-Authentication-Tests');
		
		group: 'ModuleTests' with: #(
			#'WebCopperModule-Security-Tests'
			#'WebCopperModule-Walrus-Tests');
			
		group: 'ExampleTests' with: #(
			#'WebCopperExample-TodoApp');
		
		group: 'Tests' with: #(
			#'CoreTests'
			#'FeatureTests'
			#'ModuleTests'
			#'ExampleTests')
		
	
]

{ #category : #packages }
BaselineOfWebCopper >> toolPackages: spec [
	
	spec 
	
		"Tool packages"
		package: #'WebCopperTool-Refactoring';
		package: #'WebCopperTool-Scaffolding'
]

{ #category : #dependencies }
BaselineOfWebCopper >> walrus: spec [

	spec
		baseline: 'Walrus' with: [ spec
		repository: 'github://GlennCavarle/Walrus/src' ].
]

{ #category : #dependencies }
BaselineOfWebCopper >> zincComponents: spec [

	spec
		baseline: 'ZincHTTPComponents' with: [ spec
		repository: 'github://svenvc/zinc/repository' ].
		
]
