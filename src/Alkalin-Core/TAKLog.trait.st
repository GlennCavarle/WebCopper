Trait {
	#name : #TAKLog,
	#category : #'Alkalin-Core-Utils'
}

{ #category : #logging }
TAKLog classSide >> error: aString [
	"Note: Should be enabled with ===AKGlobalSettings enablelogs==="

	self logsEnabled
		ifTrue: [ AKLogger error: aString ]
]

{ #category : #asserting }
TAKLog classSide >> logsEnabled [
	<return: #Boolean>
	^ AKGlobalSettings logsEnabled
]

{ #category : #private }
TAKLog >> error: aString [
	self class error: aString
]
