Class {
	#name : #AKDiTag,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'Alkalin-Di-Definition'
}

{ #category : #accessing }
AKDiTag class >> name: aSymbol [
	^ super new
		name: aSymbol;
		yourself
]

{ #category : #accessing }
AKDiTag class >> new [
	^ self shouldNotImplement
]

{ #category : #accessing }
AKDiTag >> name [
	^ name
]

{ #category : #accessing }
AKDiTag >> name: anObject [
	name := anObject
]
