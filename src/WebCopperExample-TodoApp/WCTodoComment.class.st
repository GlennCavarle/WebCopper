Class {
	#name : #WCTodoComment,
	#superclass : #Object,
	#instVars : [
		'id',
		'text'
	],
	#category : #'WebCopperExample-TodoApp-Model'
}

{ #category : #accessing }
WCTodoComment class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping | 
		(mapping mapInstVar: #id) valueSchema: UUID.
		(mapping mapInstVar: #text).
	]
]

{ #category : #'instance creation' }
WCTodoComment class >> withId: anId text: aTodoText [
	^ self new
		id: anId;
		text: aTodoText;
		yourself
]

{ #category : #accessing }
WCTodoComment >> id [
	^ id
]

{ #category : #accessing }
WCTodoComment >> id: anObject [
	id := anObject
]

{ #category : #accessing }
WCTodoComment >> text [
	^ text
]

{ #category : #accessing }
WCTodoComment >> text: anObject [
	text := anObject
]
