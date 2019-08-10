Class {
	#name : #WCEvent,
	#superclass : #Object,
	#instVars : [
		'canBePropagated'
	],
	#category : #'WebCopper-EventDispatcher'
}

{ #category : #testing }
WCEvent >> canBePropagated [
	^ canBePropagated ifNil: [ canBePropagated := true ]
]

{ #category : #accessing }
WCEvent >> stopPropagation [
	canBePropagated := false
]
