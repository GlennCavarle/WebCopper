# Security Module


## Kernel configuration

### How to register

```smalltalk
MyKernelConfig >> modules
    ^ {
        WCSecurityModule new
    }
```


### How to configure

|          |                                    |
|---       | ---                                |
| method   | `KernelConfig>>configureSecurity:` |
| argument | `SecurityModuleConfig` instance    |


> Example of a dummy configuration

```smalltalk
MyKernelConfig >> configureSecurity: aSecurityConfig
	
    aSecurityConfig
        addUserProvider:[:upBuilder|upBuilder
            providerClass: #WCInMemoryUserProvider;
            configure:[:p|p
                addUser: (WCUser username: 'John' password: 'password');
                addUser: (WCUser username: 'Brenda' password: 'password')]];

        addAuthenticator:[ :authBuilder| authBuilder 
            urlRegex: '^/admin.*';
            authenticatorClass: #WCBasicAuthenticator].
```
