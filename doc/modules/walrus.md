# Walrus Module


## Kernel configuration

### How to register

```smalltalk
MyKernelConfig >> modules
    ^ {
        AKWalrusModule new
    }
```


### How to configure

|          |                                    |
|---       | ---                                |
| method   | `KernelConfig>>configureWalrus:` |
| argument | `WalrusModuleConfig` instance    |


> Example of a dummy configuration

```smalltalk
MyKernelConfig >> configureWalrus: aWalrusConfig
	
    aWalrusConf

        addContext:[:aCxtBuilder| aCxtBuilder
            identifier: #DefaultDbContext;
            host: '172.17.0.2' port: 27017;
            database: 'todo-db';
            metadataFactory: WRClassMetadataFactory withClassMethodLoader];

        addRepository:[:aRepoBuilder| aRepoBuilder
            identifier: #TodoRepo;
            repository: TodoRepository;
            model: WRTestObject ]
```
