Class {
	#name : #AKTodoComment,
	#superclass : #Object,
	#instVars : [
		'id',
		'text'
	],
	#category : #'AlkalinExample-TodoApp-Model'
}

{ #category : #accessing }
AKTodoComment class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | 
		(mapping mapInstVar: #id) valueSchema: OID.
		(mapping mapInstVar: #text).
	]
]

{ #category : #'as yet unclassified' }
AKTodoComment class >> withId: anId text: aTodoText [
	^ self new
		id: anId;
		text: aTodoText;
		yourself
]

{ #category : #accessing }
AKTodoComment >> id [
	^ id
]

{ #category : #accessing }
AKTodoComment >> id: anObject [
	id := anObject
]

{ #category : #accessing }
AKTodoComment >> text [
	^ text
]

{ #category : #accessing }
AKTodoComment >> text: anObject [
	text := anObject
]
