Extension { #name : #AKRouteCollection }

{ #category : #'*Ark-HttpRouter' }
AKRouteCollection >> gtInspectorRoutesIn: composite [
	<gtInspectorPresentationOrder: 0>  
	
	^(composite list)
		title: ['Routes' translated];		 
		display: [ routes ]; 
		format: [:each | each printString ]
]
