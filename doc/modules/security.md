# Security Module


## Kernel configuration

### How to register

```smalltalk
MyKernelConfig >> modules
    ^ {
        AKSecurityModule new
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
            providerClass: #AKInMemoryUserProvider;
            configure:[:p|p
                addUser: (AKUser username: 'John' password: 'password');
                addUser: (AKUser username: 'Brenda' password: 'password')]];

        addAuthenticator:[ :authBuilder| authBuilder 
            urlRegex: '^/admin.*';
            authenticatorClass: #AKBasicAuthenticator].
```
