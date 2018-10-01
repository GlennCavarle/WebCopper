Class {
	#name : #AKKernelTest,
	#superclass : #TestCase,
	#category : #'Alkalin-HttpKernel-Tests'
}

{ #category : #'as yet unclassified' }
AKKernelTest >> createStoryOn: anApp [
	^ ApcStory new
		description: '';
		httpClient: (ApcHandlerClient on: anApp);
		requestClass: AKHttpRequest;
		yourself
]

{ #category : #tests }
AKKernelTest >> test [

	|k|
	
k := AKKernel new.

k router 
	prefix:'/api';
	GET:'/route/get' -> [ :req| AKHttpResponse accepted];
	GET:'/route/:id(\d+)' -> [ :req| AKHttpResponse accepted].
	

self assert: (k handleRequest: (AKHttpRequest get:'/api/route/get')) isSuccess.
self assert: (k handleRequest: (AKHttpRequest get:'/api/route/12')) isSuccess.
	
]

{ #category : #tests }
AKKernelTest >> testWithApicall [
	| app story |
	app := AKKernel new.
	app router
		prefix: '/api';
		GET: '/route/get' -> [ :req | AKJsonResponse accepted ];
		GET: '/route/:id(\d+)' -> [ :req | AKJsonResponse accepted ].
		
		
	story := self createStoryOn: app.
	story
		when: [ :w | w get: '/api/route/get' ];
		then: [ :t | 
			t status isAccepted.
			t headers hasJsonContentType ];
		execute.
	story
		when: [ :w | w get: '/api/route/12' ];
		then: [ :t | 
			t status isAccepted.
			t headers hasJsonContentType ];
		execute
]
