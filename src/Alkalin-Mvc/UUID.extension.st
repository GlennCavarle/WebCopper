Extension { #name : #UUID }

{ #category : #'*Alkalin-Mvc' }
UUID class >> neoJsonMapping: mapper [
	
	mapper for: self customDo: [ :mapping |
		mapping decoder: [ :string | UUID fromString: string ].
		mapping encoder: [ :uuid | uuid asString ] ].
]
