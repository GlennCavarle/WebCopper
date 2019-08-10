Class {
	#name : #WCDiTag,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'WebCopper-Di-Definition'
}

{ #category : #accessing }
WCDiTag class >> name: aSymbol [
	^ super new
		name: aSymbol;
		yourself
]

{ #category : #accessing }
WCDiTag class >> new [
	^ self shouldNotImplement
]

{ #category : #accessing }
WCDiTag >> name [
	^ name
]

{ #category : #accessing }
WCDiTag >> name: anObject [
	name := anObject
]
