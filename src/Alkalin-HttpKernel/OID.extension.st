Extension { #name : #OID }

{ #category : #'*Alkalin-HttpKernel' }
OID class >> neoJsonMapping: mapper [
	
	mapper for: self customDo: [ :mapping |
		mapping decoder: [ :val | (OID value: (Integer readFrom:val base:16)) ].
		mapping encoder: [ :oid | oid value printStringHex ] ].
]
