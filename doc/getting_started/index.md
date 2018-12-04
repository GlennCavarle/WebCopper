# Getting Started

## Installation

```smalltalk

Metacello new
    baseline: 'Alkalin';
    repository: 'github://GlennCavarle/Alkalin/src';
    load: 'Core'

```

## Running your first App

In Alkalin, there is a clear separation between your application and the server which serves it.  
 
An application is basically a request handler which manage how to create the right a response depending on the route called. This is the role of the Kernel: managing the request lifecycle in order to produce a response.

The simplest way to create your first app is to script it like this :

```smalltalk
"1) Create your app"
myApp := AKKernel configure:[:k| 
    k router
        GET: '/welcome' -> [:req| AKHttpResponse accepted ];
        GET: '/.*' -> [:req| AKHttpResponse notFound: req url]
].
```

The server is only the bridge between your application and the external world. It creates requests (AKHttpRequest) from client raw data, it serves them to the registred handlers and finally it converts the returning responses (AKHttpResponse) to raw data in order to be returned to the client.

Basically, you can register your application ans start a server as below :

```smalltalk
"2) Start the server"
AKHttpServer on
    port: 8080;
    registerDefault: myApp;
    start
```


> **Tips:** These 2 steps can also be done in once :  

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