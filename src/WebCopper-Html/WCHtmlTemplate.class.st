Class {
	#name : #WCHtmlTemplate,
	#superclass : #Object,
	#instVars : [
		'viewModel'
	],
	#category : #'WebCopper-Html-Template'
}

{ #category : #visiting }
WCHtmlTemplate >> accept: aVisitor [
	aVisitor visitTemplate: self
]

{ #category : #building }
WCHtmlTemplate >> document [
	^ WCHtmlDocument new
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
WCHtmlTemplate >> insertBody: aBody [
	
]

{ #category : #templating }
WCHtmlTemplate >> insertBodyScripts: aBody [
	"aBody
		script: [ :script | script src: 'lib.js' ];
		script: [ :script | script src: 'all.concat.js' ]"
]

{ #category : #templating }
WCHtmlTemplate >> insertHeaderLinks: anHeader [
	"anHeader
		link: [ :link1 | link1 rel: 'stylesheet' href:'https://mywebsite.com/styles.min.css' ]"

	
]

{ #category : #templating }
WCHtmlTemplate >> insertHeaderMeta: anHeader [
	"anHeader meta: [ :meta | meta charset: 'utf-8' ]"
]

{ #category : #templating }
WCHtmlTemplate >> insertHeaderScripts: anHeader [
	"anHeader
		script: [ :script | script src: 'lib.js' ];
		script: [ :script | script src: 'all.concat.js' ]"
]

{ #category : #templating }
WCHtmlTemplate >> insertTitle: aTitle [
	"aTitle text: 'My First App'"
]

{ #category : #printing }
WCHtmlTemplate >> printOn: aStream [
	aStream nextPutAll: (WCHtmlRenderer renderHtml: self document)
]

{ #category : #accessing }
WCHtmlTemplate >> viewModel [
	^ viewModel
]

{ #category : #accessing }
WCHtmlTemplate >> viewModel: anObject [
	viewModel := anObject
]
