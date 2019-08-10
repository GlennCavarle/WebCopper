Class {
	#name : #WCTodo,
	#superclass : #Object,
	#instVars : [
		'id',
		'text',
		'comments'
	],
	#category : #'WebCopperExample-TodoApp-Model'
}

{ #category : #'json mapping' }
WCTodo class >> example1 [
	^ (self withId: UUID new text: 'Do something')
		addComment: (WCTodoComment withId: UUID new text: 'MyComment');
		yourself
]

{ #category : #'json mapping' }
WCTodo class >> neoJsonMapping: mapper [
	
	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #id) valueSchema: UUID.
		(mapping mapInstVar: #text).
		(mapping mapInstVar: #comments) valueSchema: #'AKTodoComment[]' .
		].
	
	mapper for: #'AKTodoComment[]'  customDo: [ :mapping |
		mapping listOfElementSchema: WCTodoComment
	].
]

{ #category : #'instance creation' }
WCTodo class >> withId: anId text: aTodoText [
	^ self new
		id: anId;
		text: aTodoText;
		yourself
]

{ #category : #accessing }
WCTodo >> addComment: aAKTodoComment [
	comments add: aAKTodoComment
]

{ #category : #accessing }
WCTodo >> comments [
	^ comments copy
]

{ #category : #accessing }
WCTodo >> id [
	^ id
]

{ #category : #accessing }
WCTodo >> id: anObject [
	id := anObject
]

{ #category : #initialization }
WCTodo >> initialize [
	super initialize.
	comments := OrderedCollection new.
]

{ #category : #accessing }
WCTodo >> removeComment: aAKTodoComment [
	comments remove: aAKTodoComment
]

{ #category : #accessing }
WCTodo >> text [
	^ text
]

{ #category : #accessing }
WCTodo >> text: anObject [
	text := anObject
]
