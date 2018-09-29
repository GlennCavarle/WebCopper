Class {
	#name : #AKTodo,
	#superclass : #Object,
	#instVars : [
		'id',
		'text',
		'comments'
	],
	#category : #'AlkalinExample-TodoApp'
}

{ #category : #accessing }
AKTodo class >> example1 [
	^ (self withId: UUID new text: 'Do something')
		addComment: (AKTodoComment withId: UUID new text: 'MyComment');
		yourself
]

{ #category : #accessing }
AKTodo class >> neoJsonMapping: mapper [
	
	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #id) valueSchema: UUID.
		(mapping mapInstVar: #text).
		(mapping mapInstVar: #comments) valueSchema: #'AKTodoComment[]' .
		].
	
	mapper for: #'AKTodoComment[]'  customDo: [ :mapping |
		mapping listOfElementSchema: AKTodoComment
	].
]

{ #category : #'instance creation' }
AKTodo class >> withId: anId text: aTodoText [
	^ self new
		id: anId;
		text: aTodoText;
		yourself
]

{ #category : #accessing }
AKTodo >> addComment: aAKTodoComment [
	comments add: aAKTodoComment
]

{ #category : #accessing }
AKTodo >> comments [
	^ comments copy
]

{ #category : #accessing }
AKTodo >> id [
	^ id
]

{ #category : #accessing }
AKTodo >> id: anObject [
	id := anObject
]

{ #category : #initialization }
AKTodo >> initialize [
	super initialize.
	comments := OrderedCollection new.
]

{ #category : #accessing }
AKTodo >> removeComment: aAKTodoComment [
	comments remove: aAKTodoComment
]

{ #category : #accessing }
AKTodo >> text [
	^ text
]

{ #category : #accessing }
AKTodo >> text: anObject [
	text := anObject
]
