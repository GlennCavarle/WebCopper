# The HttpKernel Component


## Kernel Events

* **AKKernelRequestEvent :**  
    first event dispatched
* **AKKernelFilterActionEvent :**  
    event dispatched when the event contains an action
* **AKKernelResponseFromResultEvent :**  
    event dispatched when the event contains an http response
* **AKKernelFilterResponseEvent :**    
    event dispatched before returning the response
* **AKKernelExceptionEvent :**    
    event dispatched when an exception is raised

## Kernel Exceptions

* **AKKernelDoesNotReturnResult :**  
    exception raised when an action does ot return a result
* **AKKernelDoesNotReturnHttpResponse :**  
    exception raised at the end, when no http response is returned 