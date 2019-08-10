Class {
	#name : #WCHttpServerTest,
	#superclass : #TestCase,
	#category : #'WebCopper-HttpServer-Tests'
}

{ #category : #tests }
WCHttpServerTest >> test [
	|server|
	
	server := WCMockHttpServer on
		port: 8080;
		at: '/api' register: (WCKernel configure: [:k| 
					k router
						prefix:'/v2';
						GET:'/route/get' -> [ :req| WCHttpResponse accepted];
						GET:'/route/:id(\d+)' -> [ :req| WCHttpResponse accepted].
	  ]).

self assert: (server handleRequest: (WCHttpRequest get:'/api/v2/route/get')) isSuccess.
self assert: (server handleRequest: (WCHttpRequest get:'/api/v2/route/12')) isSuccess.
]
