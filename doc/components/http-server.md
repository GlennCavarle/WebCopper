# The HttpServer Component

WCHttpServer is a web server which use [ZnServer](https://github.com/svenvc/zinc) internally.  
It provides default configurations and facilities to support the WebCopper framework.  

With WCHttpServer, raw http requests are converted to WCHttpRequest instances and handled by the internal dispatcher (WCHttpServerDispatcher class).




##  Start a server

```smalltalk
WCHttpServer on
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

WCHttpServer is built as a singleton which means that only one instance of the server can be started at the same time.



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
WCHttpServer on
    port: 8080;
    debugMode: true;
    at: '/assets' register: (WCServeStatic from: '/path/to/assets');
    at: '/api' register: myApiKernel;
    registerDefault: myWebsiteKernel;
    "same as"
    at:#default register: myWebsiteKernel;
    start.
```

## Serving static files

Even if it is recommended to manage static files with your low level http server like Apache or nginx, you can also serve them using WCHttpServer.

```smalltalk
WCHttpServer on
    port: 8080;
    debugMode: true;
    at: '/assets' register: (WCServeStatic from: '/path/to/assets');
    "or if you only serve static files"
    registerDefault: (WCServeStatic from: '/path/to/assets');
    start.
```

## Scripting facilities

```smalltalk
WCHttpServer on
    port: 8080;
    withDefaultKernel: [:k| 
        k router
            GET: '/welcome' -> [:req| WCHttpResponse accepted ];
            GET: '/.*' -> [:req| WCHttpResponse notFound: req url]  
    ]
    start
```