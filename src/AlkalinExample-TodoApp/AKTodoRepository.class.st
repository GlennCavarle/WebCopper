Class {
	#name : #AKTodoRepository,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'AlkalinExample-TodoApp'
}

{ #category : #public }
AKTodoRepository >> add: aTodoModel [
	data add: aTodoModel
]

{ #category : #initialization }
AKTodoRepository >> initialize [
	super initialize.
	
	data := Set new.
]

{ #category : #public }
AKTodoRepository >> removeAll [
	^ data removeAll
]

{ #category : #public }
AKTodoRepository >> removeById: anId [
	^ self removeOne:[:each| each id = anId]
]

{ #category : #public }
AKTodoRepository >> removeOne: aBlock [
	^ data copy do: [ :each | (aBlock value: each) ifTrue: [ ^ data remove: each ] ]
]

{ #category : #public }
AKTodoRepository >> selectAll [
	^ data copy
]

{ #category : #public }
AKTodoRepository >> selectById: anId [
	^ self selectOne: [:each| each id = anId]
]

{ #category : #public }
AKTodoRepository >> selectMany: aBlock [
	^ data select: aBlock
]

{ #category : #public }
AKTodoRepository >> selectOne: aBlock [
	^ data detect: aBlock
]
