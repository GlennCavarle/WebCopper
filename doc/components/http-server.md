# The HttpServer Component

AKHttpServer is a web server which use [ZnServer](https://github.com/svenvc/zinc) internally.  
It provides default configurations and facilities to support the Alkalin framework.  

With AKHttpServer, raw http requests are converted to AKHttpRequest instances and handled by the internal dispatcher (AKHttpServerDispatcher class).




##  Start a server

```smalltalk
AKHttpServer on
    port: 8080;
    "open a Debugger when an error is raised during request handling"
    debugMode:true; 
    "your custom configuration"
    "at:register:"
    "registerDefault:"
    "withDefaultKernel:"
    start	
```


## Controlling the server

AKHttpServer is built as a singleton which means that only one instance of the server can be started at the same time.



```smalltalk
"reset the current server and start a new one"
AkHttpServer on.
"restart the server with the same configuration"
AkHttpServer restart.
"stop the server"
AkHttpServer stop.
"stop the server and clean the unique instance"
AkHttpServer reset.
"return the current server instance"
AkHttpServer uniqueInstance. 
```

## Managing url prefixes

The server can be configured to manage separated prefixes.
For example, you can define a prefix in order to [serve static files](#serving-static-files).

In order to manage requests with undefined prefixes, a special prefix named `#default` is used to register the default request handler. 

```smalltalk
AKHttpServer on
    port: 8080;
    debugMode: true;
    at: '/assets' register: (AKServeStatic from: '/path/to/assets');
    at: '/api' register: myApiKernel;
    registerDefault: myWebsiteKernel;
    "same as"
    at:#default register: myWebsiteKernel;
    start.
```

## Serving static files

Even if it is recommended to manage static files with your low level http server like Apache or nginx, you can also serve them using AKHttpServer.

```smalltalk
AKHttpServer on
    port: 8080;
    debugMode: true;
    at: '/assets' register: (AKServeStatic from: '/path/to/assets');
    "or if you only serve static files"
    registerDefault: (AKServeStatic from: '/path/to/assets');
    start.
```

## Scripting facilities

```smalltalk
AKHttpServer on
    port: 8080;
    withDefaultKernel: [:k| 
        k router
            GET: '/welcome' -> [:req| AKHttpResponse accepted ];
            GET: '/.*' -> [:req| AKHttpResponse notFound: req url]  
    ]
    start
```