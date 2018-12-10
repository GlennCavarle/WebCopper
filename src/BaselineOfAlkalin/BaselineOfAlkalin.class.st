Class {
	#name : #BaselineOfAlkalin,
	#superclass : #BaselineOf,
	#category : #BaselineOfAlkalin
}

{ #category : #dependencies }
BaselineOfAlkalin >> apical: spec [

	spec
		baseline: 'Apical' with: [ spec
		repository: 'github://GlennCavarle/Apical/src' ].
]

{ #category : #baselines }
BaselineOfAlkalin >> baseline: spec [
	<baseline>

	spec for: #common do: [
		
		self
			zincComponents: spec;
			neoJson: spec;
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
BaselineOfAlkalin >> corePackages: spec [
	
	spec 
	
		"Base packages"
		package: #'Alkalin-Core';
		package: #'Alkalin-EventDispatcher' with: [ spec requires: #(#'Alkalin-Core') ];
		package: #'Alkalin-Di' with: [ spec requires: #(#'Alkalin-Core') ];
		package: #'Alkalin-HttpMessage' with: [ spec requires: #(#'Alkalin-Core' #ZincHTTPComponents #NeoJSON) ];
		package: #'Alkalin-HttpRouter' with: [ spec requires: #(#'Alkalin-HttpMessage') ];
		package: #'Alkalin-HttpServer' with: [ spec requires: #(#'Alkalin-HttpMessage') ];
		package: #'Alkalin-HttpKernel' with: [ spec requires: #(#'Alkalin-Di' #'Alkalin-EventDispatcher' #'Alkalin-HttpRouter') ];
		
		"Tests"
		package: #'Alkalin-EventDispatcher-Tests' with: [ spec requires: #(#'Alkalin-EventDispatcher') ];
		package: #'Alkalin-HttpRouter-Tests' with: [ spec requires: #(#'Alkalin-HttpRouter') ];
		package: #'Alkalin-Di-Tests' with: [ spec requires: #(#'Alkalin-Di') ];
		package: #'Alkalin-HttpServer-Tests' with: [ spec requires: #(#'Alkalin-HttpServer' #Apical) ];
		package: #'Alkalin-HttpKernel-Tests' with: [ spec requires: #(#'Alkalin-HttpKernel' #Apical) ]
		
		
]

{ #category : #packages }
BaselineOfAlkalin >> enventSourcingPackages: spec [
	
	spec 
	
		"event sourcing"
		package: #'Alkalin-Ubiq'  with: [ spec requires: #(#'Alkalin-HttpKernel') ];
		
		"Examples"
		package: #'AlkalinExample-ComplexApp'  with: [ spec requires: #(#'Alkalin-Ubiq') ];
		
		"Tests"
		package: #'Alkalin-Ubiq-Tests' with: [ spec requires: #(#'Alkalin-Ubiq') ]
			
]

{ #category : #packages }
BaselineOfAlkalin >> examplePackages: spec [
	
	spec 
		
		"Examples"
		package: #'AlkalinExample-TodoApp' with: [ 
			spec requires: #(#'Alkalin-HttpKernel' #'AlkalinModule-Security' 'Alkalin-Html' #Apical) ]
	
]

{ #category : #packages }
BaselineOfAlkalin >> extraPackages: spec [
	spec
			
		"Extra"
		package: #'Alkalin-Refactoring'
		
		"Tests"
		
		
]

{ #category : #packages }
BaselineOfAlkalin >> featurePackages: spec [
	
	spec 
	
		"Feature packages"
		package: #'Alkalin-Html';
		package: #'Alkalin-Authentication' with: [ spec requires: #(#'Alkalin-HttpMessage') ];
		
		"Tests"
		package: #'Alkalin-Html-Tests' with: [ spec requires: #(#'Alkalin-Html') ];
		package: #'Alkalin-Authentication-Tests' with: [ spec requires: #(#'Alkalin-Authentication') ]
		
		
]

{ #category : #groups }
BaselineOfAlkalin >> groups: spec [

	spec 
		group: 'Core' with: #(
			#'Alkalin-HttpKernel'
			#'Alkalin-HttpServer');
			
		group: 'SecurityModule' with: #(
			#'AlkalinModule-Security');
		group: 'WalrusModule' with: #(
			#'AlkalinModule-Walrus');
		
		group: 'TodoAppExample' with: #(
			#'AlkalinExample-TodoApp');
		
		group: 'default' with: #('Core')
]

{ #category : #packages }
BaselineOfAlkalin >> modulePackages: spec [
	spec
	
		"Modules"
		package: #'AlkalinModule-Security' with: [ spec requires: #(#'Alkalin-HttpKernel' #'Alkalin-Authentication') ];
		package: #'AlkalinModule-Walrus' with: [ spec requires: #(#'Alkalin-HttpKernel' #'Walrus') ];
		
		"Tests"
		package: #'AlkalinModule-Security-Tests' with: [ spec requires: #(#'AlkalinModule-Security') ];
		package: #'AlkalinModule-Walrus-Tests' with: [ spec requires: #(#'AlkalinModule-Walrus') ]

]

{ #category : #dependencies }
BaselineOfAlkalin >> neoJson: spec [

	spec 
		configuration: 'NeoJSON' with: [ spec
		repository: 'github://svenvc/NeoJSON/repository' ]
]

{ #category : #groups }
BaselineOfAlkalin >> testGroups: spec [

	spec 
		
		group: 'CoreTests' with: #(
			#'Alkalin-EventDispatcher-Tests'
			#'Alkalin-HttpRouter-Tests'
			#'Alkalin-Di-Tests'
			#'Alkalin-HttpServer-Tests'
			#'Alkalin-HttpKernel-Tests');
		
		group: 'FeatureTests' with: #(
			#'Alkalin-Authentication-Tests');
		
		group: 'ModuleTests' with: #(
			#'AlkalinModule-Security-Tests'
			#'AlkalinModule-Walrus-Tests');
			
		group: 'ExampleTests' with: #(
			#'AlkalinExample-TodoApp');
		
		group: 'Tests' with: #(
			#'CoreTests'
			#'FeatureTests'
			#'ModuleTests'
			#'ExampleTests')
		
	
]

{ #category : #packages }
BaselineOfAlkalin >> toolPackages: spec [
	
	spec 
	
		"Tool packages"
		package: #'AlkalinTool-Refactoring';
		package: #'AlkalinTool-Scaffolding'
]

{ #category : #dependencies }
BaselineOfAlkalin >> walrus: spec [

	spec
		baseline: 'Walrus' with: [ spec
		repository: 'github://GlennCavarle/Walrus/src' ].
]

{ #category : #dependencies }
BaselineOfAlkalin >> zincComponents: spec [

	spec
		baseline: 'ZincHTTPComponents' with: [ spec
		repository: 'github://svenvc/zinc/repository' ].
		
]
