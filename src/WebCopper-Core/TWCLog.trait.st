Trait {
	#name : #TWCLog,
	#category : #'WebCopper-Core-Utils'
}

{ #category : #logging }
TWCLog classSide >> error: aString [
	"Note: Should be enabled with ===AKGlobalSettings enablelogs==="

	self logsEnabled
		ifTrue: [ WCLogger error: aString ]
]

{ #category : #asserting }
TWCLog classSide >> logsEnabled [
	<return: #Boolean>
	^ WCGlobalSettings logsEnabled
]

{ #category : #private }
TWCLog >> error: aString [
	self class error: aString
]
