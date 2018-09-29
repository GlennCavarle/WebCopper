Class {
	#name : #AKServiceContainerTest,
	#superclass : #TestCase,
	#category : #'Alkalin-Di-Tests'
}

{ #category : #tests }
AKServiceContainerTest >> testAddDefinition [
	| container testObject1 testObject2 |
	container := AKDiContainer new.
	container
	
		addDefinition: [ :def | def
				identifier: #TestObject1;
				targetClass: OrderedCollection;
				constructor: #new;
				methodCall: #add: withArgs: {#TestObject2 asAKServiceRef}];
			
		addDefinition: [ :def | def
				identifier: #TestObject2;
				targetClass: Object ].
			
	testObject1 := container get: #TestObject1.
	testObject2 := container get: #TestObject2.
	
	self assert: (testObject1 isKindOf: OrderedCollection).
	self assert: testObject1 size = 1.
	self assert: testObject1 first = testObject2
]

{ #category : #tests }
AKServiceContainerTest >> testGetExistingKeys [
	
	|container i1 i2|
	
container := AKDiContainer new.

container registerClass:Object as: #TheObject.

i1 := container get: #TheObject.
i2 := container get: #TheObject.

self assert: (i1 isKindOf: Object).
self assert: (i2 isKindOf: Object).
self assert: i1 == i2
]

{ #category : #tests }
AKServiceContainerTest >> testGetUnknownKey [
	| container |
	container := AKDiContainer new.
	self should: [ container get: #UnknownKey ] raise: AKDiServiceNotFound
]

{ #category : #tests }
AKServiceContainerTest >> testRegisterReservedKey [
	| container |
	container := AKDiContainer new.
	self should: [ container registerClass: Object as: #ServiceContainer ] raise: AKDiReservedServiceKey
]

{ #category : #tests }
AKServiceContainerTest >> testTags [
	| container servicesWithTag1 servicesWithTag2 |
	container := AKDiContainer new.
	container
	
		addDefinition: [ :def | def
				identifier: #TestObject1;
				targetClass: Object ;
				tag: (AKDiTag name:#tag1)];
			
		addDefinition: [ :def | def
				identifier: #TestObject2;
				targetClass: Object ;
				tag: (AKDiTag name:#tag1);
				tag: (AKDiTag name:#tag2)].
			
	servicesWithTag1 := container servicesWithTag: #tag1.
	servicesWithTag2 := container servicesWithTag: #tag2.
	
	self assert: servicesWithTag1 size = 2.
	self assert: servicesWithTag2 size = 1.
	
]
