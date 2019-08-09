# The HttpKernel Component


## Kernel Events

* **WCKernelRequestEvent :**  
    first event dispatched
* **WCKernelFilterActionEvent :**  
    event dispatched when the event contains an action
* **WCKernelResponseFromResultEvent :**  
    event dispatched when the event contains an http response
* **WCKernelFilterResponseEvent :**    
    event dispatched before returning the response
* **WCKernelExceptionEvent :**    
    event dispatched when an exception is raised

## Kernel Exceptions

* **WCKernelDoesNotReturnResult :**  
    exception raised when an action does ot return a result
* **WCKernelDoesNotReturnHttpResponse :**  
    exception raised at the end, when no http response is returned 