Class {
	#name : #AKEvent,
	#superclass : #Object,
	#instVars : [
		'canBePropagated'
	],
	#category : #'Alkalin-EventDispatcher'
}

{ #category : #testing }
AKEvent >> canBePropagated [
	^ canBePropagated ifNil: [ canBePropagated := true ]
]

{ #category : #accessing }
AKEvent >> stopPropagation [
	canBePropagated := false
]
