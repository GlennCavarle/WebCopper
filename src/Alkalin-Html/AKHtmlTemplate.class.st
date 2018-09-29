Class {
	#name : #AKHtmlTemplate,
	#superclass : #Object,
	#category : #'Alkalin-Html-Template'
}

{ #category : #'as yet unclassified' }
AKHtmlTemplate >> accept: aVisitor [
	aVisitor visitTemplate: self
]

{ #category : #parsing }
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
							self insertBody: body ] ]
]

{ #category : #'as yet unclassified' }
AKHtmlTemplate >> insertBody: aBody [
	
]

{ #category : #'as yet unclassified' }
AKHtmlTemplate >> insertHeaderLinks: anHeader [
	"anHeader
		link: [ :link1 | link1 rel: 'stylesheet' href:'https://mywebsite.com/styles.min.css' ]"

	
]

{ #category : #'as yet unclassified' }
AKHtmlTemplate >> insertHeaderMeta: anHeader [
	"anHeader meta: [ :meta | meta charset: 'utf-8' ]"
]

{ #category : #'as yet unclassified' }
AKHtmlTemplate >> insertHeaderScripts: anHeader [
	"anHeader
		script: [ :script | script src: 'https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular.js' ];
		script: [ :script | script src: 'https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.2/angular-route.js' ];
		script: [ :script | script src: 'jblib.js' ];
		script: [ :script | script src: 'all.concat.js' ]"
]

{ #category : #'as yet unclassified' }
AKHtmlTemplate >> insertTitle: aTitle [
	aTitle text: 'My First App'
]
