Class {
	#name : #AKTodoCommentMapping,
	#superclass : #WRAnnotationMapping,
	#category : #'AlkalinExample-TodoApp-Mapping'
}

{ #category : #accessing }
AKTodoCommentMapping class >> classMetadata [
	<walrusClassMetadataFor:#AKTodoComment>
	
	^ WRClassMetadata new
		database: 'todo-database';
		collection: 'todo-comment-collection';
		yourself
]

{ #category : #accessing }
AKTodoCommentMapping class >> id [
	<walrusPropertyMetadata>
	
	^ (WRIdentifierMetadata named: #id)
		field: #_id;
		type:#OID;
		yourself
]

{ #category : #accessing }
AKTodoCommentMapping class >> text [
	<walrusPropertyMetadata>
	
	^ WRPropertyMetadata named: #text type: #String
]
