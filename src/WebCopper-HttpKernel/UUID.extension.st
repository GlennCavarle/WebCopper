Extension { #name : #UUID }

{ #category : #'*WebCopper-HttpKernel' }
UUID class >> neoJsonMapping: mapper [
	
	mapper for: self customDo: [ :mapping |
		mapping decoder: [ :string | UUID fromString: string ].
		mapping encoder: [ :uuid | uuid asString ] ].
]
