# The Extension System

An extension allows to make some processes at the end of the configuration stage.  
It is commonly used to manipulate the [DI container](#), adding some services or registring some event listeners based on the container configuration.


Extensions used in your application must be enabled in your [kernel configuration](#).

```smalltalk

MyKernelConfig >> extensions
    ^ {
        MyExtension new.
        MyOtherExtension new.
    }

```