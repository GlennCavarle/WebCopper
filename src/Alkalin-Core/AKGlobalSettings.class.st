Class {
	#name : #AKGlobalSettings,
	#superclass : #Object,
	#classVars : [
		'AppEnv',
		'AssertionsEnabled',
		'DefaultLogLevel',
		'LogEnabled',
		'LogsEnabled',
		'PreferableLoggerBackendClass'
	],
	#category : #'Alkalin-Core-Settings'
}

{ #category : #accessing }
AKGlobalSettings class >> appEnv [
	^ AppEnv ifNil:[AppEnv := #dev ]
]

{ #category : #accessing }
AKGlobalSettings class >> appEnv: aSymbol [
	AppEnv := aSymbol
]

{ #category : #assertions }
AKGlobalSettings class >> assertionsEnabled [
	^ AssertionsEnabled ifNil: [ true ]
]

{ #category : #assertions }
AKGlobalSettings class >> assertionsEnabled: aBoolean [
	AssertionsEnabled := aBoolean
]

{ #category : #accessing }
AKGlobalSettings class >> defaultLogLevel [
	^ DefaultLogLevel ifNil: [ DefaultLogLevel := #info ]
]

{ #category : #accessing }
AKGlobalSettings class >> defaultLogLevel: aLevelName [
	DefaultLogLevel := aLevelName.
	self initLogger.
]

{ #category : #assertions }
AKGlobalSettings class >> disableAssertions [
	self assertionsEnabled: false
]

{ #category : #logging }
AKGlobalSettings class >> disableLogs [
	self logsEnabled: false
]

{ #category : #assertions }
AKGlobalSettings class >> enableAssertions [
	self assertionsEnabled: true
]

{ #category : #logging }
AKGlobalSettings class >> enableLogs [
	self logsEnabled: true
]

{ #category : #private }
AKGlobalSettings class >> initLogger [
	AKLogger withDefautBackend: 
		(self preferableLoggerBackendClass 
			minLevel: (AKLogEntry levels at: self defaultLogLevel))
]

{ #category : #logging }
AKGlobalSettings class >> logsEnabled [
	^ LogsEnabled ifNil: [ true ]
]

{ #category : #logging }
AKGlobalSettings class >> logsEnabled: aBoolean [
	LogsEnabled := aBoolean
]

{ #category : #accessing }
AKGlobalSettings class >> preferableLoggerBackendClass [
	^ PreferableLoggerBackendClass ifNil: [ PreferableLoggerBackendClass := AKNullLoggerBackend ]
]

{ #category : #accessing }
AKGlobalSettings class >> preferableLoggerBackendClass: aLoggerBackendClass [
	PreferableLoggerBackendClass := aLoggerBackendClass.
	self initLogger.
]

{ #category : #settings }
AKGlobalSettings class >> preferencesOn: aBuilder [
	<systemsettings>
	(aBuilder group: #Alkalin)
		label:'Alkalin';
		description:'Alkalin settings';
		parent: #tools;
		with: [ 
			
			(aBuilder pickOne: #appEnv)
				order: 3;
				target: self;
				label: 'Environment';
				domainValues: #(dev test prod);
				description: 'Choose which environment has to be used'.
				
			(aBuilder setting: #assertionsEnabled)
				order: 4;
				target: self;
				label: 'Enable Assertions';
				description: 'Set enabled to turn assertions on or disable to turn them off';
				default: [ true ].
				
			(aBuilder setting: #logsEnabled)
				order: 5;
				target: self;
				label: 'Enable Loging';
				description: 'Set enabled to turn logs on or disable to turn them off';
				default: [ true ].
				
			(aBuilder pickOne: #preferableLoggerBackendClass)
				order: 6;
				target: self;
				label: 'Preferable Logger Backend';
				domainValues: (AKLogger availableBackends collect: [ :aClass | aClass name -> aClass ]);
				description: 'Choose which default backend to be used for logging'.
				
			(aBuilder pickOne: #defaultLogLevel)
				order: 7;
				target: self;
				label: 'Default Log Level';
				domainValues: (AKLogEntry levels associations collect: [ :assoc | (assoc key -> assoc key) ]);
				description: 'Choose which level to be used for logging'.
			
			 ]
]
