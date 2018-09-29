Class {
	#name : #BaselineOfAlkalin,
	#superclass : #BaselineOf,
	#category : #BaselineOfAlkalin
}

{ #category : #baselines }
BaselineOfAlkalin >> baseline: spec [
	<baseline>

	spec for: #common do: [
		
		spec
			baseline: 'ZincHTTPComponents' with: [ spec
			repository: 'github://svenvc/zinc/repository' ].
		
		spec 
			configuration: 'NeoJSON' with: [ spec
			repository: 'github://svenvc/NeoJSON/repository' ].
		
		spec
			baseline: 'Apical' with: [ spec
			repository: 'github://GlennCavarle/Apical/src' ].
		
		spec 
			package: #'Alkalin-Core';
			package: #'Alkalin-EventDispatcher' with: [ spec requires: #(#'Alkalin-Core') ];
			package: #'Alkalin-Di' with: [ spec requires: #(#'Alkalin-Core') ];
			package: #'Alkalin-HttpServer' with: [ spec requires: #(#'Alkalin-Core' #ZincHTTPComponents #NeoJSON) ];
			
			
			package: #'Alkalin-HttpRouter' with: [ spec requires: #(#'Alkalin-HttpServer') ];
			package: #'Alkalin-Mvc' with: [ spec requires: #(#'Alkalin-Di' #'Alkalin-EventDispatcher' #'Alkalin-HttpRouter') ];
			package: #'Alkalin-Ubiq'  with: [ spec requires: #(#'Alkalin-Mvc') ];
						
			"Tests"
			package: #'Alkalin-EventDispatcher-Tests' with: [ spec requires: #(#'Alkalin-EventDispatcher') ];
			package: #'Alkalin-HttpRouter-Tests' with: [ spec requires: #(#'Alkalin-HttpRouter') ];
			package: #'Alkalin-Di-Tests' with: [ spec requires: #(#'Alkalin-Di') ];
			package: #'Alkalin-HttpServer-Tests' with: [ spec requires: #(#'Alkalin-HttpServer') ];
			package: #'Alkalin-Mvc-Tests' with: [ spec requires: #(#'Alkalin-Mvc') ];
			package: #'Alkalin-Ubiq-Tests' with: [ spec requires: #(#'Alkalin-Ubiq') ];
			
			"Examples"
			package: #'AlkalinExample-TodoApp' with: [ spec requires: #(#'Alkalin-Mvc') ];
			package: #'AlkalinExample-ComplexApp'  with: [ spec requires: #(#'Alkalin-Ubiq') ];
			
			"Extra"
			package: #'Alkalin-Html';
			package: #'Alkalin-Html-Tests' with: [ spec requires: #(#'Alkalin-Html') ].
			
]
]
