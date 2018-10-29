Class {
	#name : #AKTodoMapping,
	#superclass : #WRAnnotationMapping,
	#category : #'AlkalinExample-TodoApp-Mapping'
}

{ #category : #accessing }
AKTodoMapping class >> classMetadata [
	<walrusClassMetadataFor:#AKTodo>
	
	^ WRClassMetadata new
		database: 'todo-database';
		collection: 'todo-collection';
		yourself
]

{ #category : #accessing }
AKTodoMapping class >> comments [
	<walrusPropertyMetadata>
	
	^ (WREmbeddedListMetadata named: #comments)
		type: #AKTodoComment;
		yourself
]

{ #category : #accessing }
AKTodoMapping class >> id [
	<walrusPropertyMetadata>
	
	^ (WRIdentifierMetadata named: #id)
		field: #_id;
		type:#OID;
		yourself
]

{ #category : #accessing }
AKTodoMapping class >> text [
	<walrusPropertyMetadata>
	
	^ WRPropertyMetadata named: #text type: #String
]
