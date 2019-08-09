# Getting Started

* [Installation](#installation)
* [Running your first dummy App](#running-your-first-dummy-app)
* [A more real world example : The TodoApp](todoapp.md)


## Installation

```smalltalk

Metacello new
    baseline: 'WebCopper';
    repository: 'github://GlennCavarle/WebCopper/src';
    load: 'Core'

```

## Running your first dummy App

In WebCopper, there is a clear separation between your application and the server which serves it.  
 
An application is basically a request handler which manages how to create the right response depending on the route called. This is the role of the Kernel: managing the request lifecycle to produce a response.

The simplest way to create your first app is to script it like this :

```smalltalk
"1) Create your app"
myApp := WCKernel configure:[:k| 
    k router
        GET: '/welcome' -> [:req| WCHttpResponse accepted ];
        GET: '/.*' -> [:req| WCHttpResponse notFound: req url]
].
```

The server is only the bridge between your application and the external world. It creates requests (WCHttpRequest) from client raw data, it serves them to the registred handlers and finally it converts the returning responses (WCHttpResponse) to raw data in order to be returned to the client.

Basically, you can register your application ans start a server as below:

```smalltalk
"2) Start the server"
WCHttpServer on
    port: 8080;
    registerDefault: myApp;
    start
```


> **Tips:** These 2 steps can also be done in once:  

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
