# The Module System

A module is a kind of Plugin which can be enabled in your application.  
It provides a way to package and share reusable features across applications.

Modules used in your application must be enabled in your [kernel configuration](#).

```smalltalk

MyKernelConfig >> modules
    ^ {
        MyModule.
        MyOtherModule.
    }

```