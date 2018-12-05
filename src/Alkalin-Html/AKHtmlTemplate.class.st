Class {
	#name : #AKHtmlTemplate,
	#superclass : #Object,
	#instVars : [
		'viewModel'
	],
	#category : #'Alkalin-Html-Template'
}

{ #category : #visiting }
AKHtmlTemplate >> accept: aVisitor [
	aVisitor visitTemplate: self
]

{ #category : #building }
AKHtmlTemplate >> document [
	^ AKHtmlDocument new
		doctype: [ :dt | dt beHTML5 ];
		html: [ :r | 
					r
						lang: 'fr';
						head: [ :h | 
									h title: [ :title | self insertTitle:title ].
									self
										insertHeaderMeta: h;
										insertHeaderLinks: h;
										insertHeaderScripts: h ];
						body: [ :body | 
							self 
								insertBody: body ;
							 	insertBodyScripts: body] ]
]

{ #category : #templating }
AKHtmlTemplate >> insertBody: aBody [
	
]

{ #category : #templating }
AKHtmlTemplate >> insertBodyScripts: aBody [
	"aBody
		script: [ :script | script src: 'lib.js' ];
		script: [ :script | script src: 'all.concat.js' ]"
]

{ #category : #templating }
AKHtmlTemplate >> insertHeaderLinks: anHeader [
	"anHeader
		link: [ :link1 | link1 rel: 'stylesheet' href:'https://mywebsite.com/styles.min.css' ]"

	
]

{ #category : #templating }
AKHtmlTemplate >> insertHeaderMeta: anHeader [
	"anHeader meta: [ :meta | meta charset: 'utf-8' ]"
]

{ #category : #templating }
AKHtmlTemplate >> insertHeaderScripts: anHeader [
	"anHeader
		script: [ :script | script src: 'lib.js' ];
		script: [ :script | script src: 'all.concat.js' ]"
]

{ #category : #templating }
AKHtmlTemplate >> insertTitle: aTitle [
	"aTitle text: 'My First App'"
]

{ #category : #printing }
AKHtmlTemplate >> printOn: aStream [
	aStream nextPutAll: (AKHtmlRenderer renderHtml: self document)
]

{ #category : #accessing }
AKHtmlTemplate >> viewModel [
	^ viewModel
]

{ #category : #accessing }
AKHtmlTemplate >> viewModel: anObject [
	viewModel := anObject
]
