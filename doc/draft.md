# AKHttpServer

AKHttpServer is a web server (singleton) built on top of ZnServer.  
It provides default configurations and facilities to support the Alkalin framework.  

With AKHttpServer, raw http requests are converted to AKHttpRequest instances and handled by the internal dispatcher (AKHttpServerDpispatcher class).




##  Start a server using a simple configuration.

```smalltalk

	AKHttpServer on
		port: 8085;
		debugMode:true;
		withDefaultKernel:[:aKernel|
			aKernel router
				GET: '/users' -> [:req| AKJsonResponse code: 200 data: { #message ->'ok' } asDictionary ];
				GET: '/.*' -> [:req| AKJsonResponse notFound: req url ]
		];
		start	
```


## Start a server with route prefix

The server can be configured to manage separated prefixes.
For example, you can define a prefix in order to serve static files.
A special prefix named #default is used to map the default

```smalltalk

  AKHttpServer on
  		port: 8080;
  		debugMode: true;
  		at: '/assets' register: (AKServeStatic from: '/path/to/assets');
  		at: '/api' register: myApiKernel;
  		registerDefault: myWebsiteKernel;
  		start.
```

# Controlling server

```smalltalk

  AkHttpServer stop.
  AkHttpServer restart.
  AkHttpServer reset.

```

# Routing

## route patterns

``` smalltalk

		'/route/:arg'.
		'/route/:arg(\d+)'.
		'/route/:arg(int|any|string)'.
		'/route/:arg(ConstraintClass)'
		
```
