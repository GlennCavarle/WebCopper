Class {
	#name : #WCGlobalSettings,
	#superclass : #Object,
	#classVars : [
		'AppEnv',
		'AssertionsEnabled',
		'DefaultLogLevel',
		'LogEnabled',
		'LogsEnabled',
		'PreferableLoggerBackendClass'
	],
	#category : #'WebCopper-Core-Settings'
}

{ #category : #accessing }
WCGlobalSettings class >> appEnv [
	^ AppEnv ifNil:[AppEnv := #dev ]
]

{ #category : #accessing }
WCGlobalSettings class >> appEnv: aSymbol [
	AppEnv := aSymbol
]

{ #category : #assertions }
WCGlobalSettings class >> assertionsEnabled [
	^ AssertionsEnabled ifNil: [ true ]
]

{ #category : #assertions }
WCGlobalSettings class >> assertionsEnabled: aBoolean [
	AssertionsEnabled := aBoolean
]

{ #category : #accessing }
WCGlobalSettings class >> defaultLogLevel [
	^ DefaultLogLevel ifNil: [ DefaultLogLevel := #info ]
]

{ #category : #accessing }
WCGlobalSettings class >> defaultLogLevel: aLevelName [
	DefaultLogLevel := aLevelName.
	self initLogger.
]

{ #category : #assertions }
WCGlobalSettings class >> disableAssertions [
	self assertionsEnabled: false
]

{ #category : #logging }
WCGlobalSettings class >> disableLogs [
	self logsEnabled: false
]

{ #category : #assertions }
WCGlobalSettings class >> enableAssertions [
	self assertionsEnabled: true
]

{ #category : #logging }
WCGlobalSettings class >> enableLogs [
	self logsEnabled: true
]

{ #category : #private }
WCGlobalSettings class >> initLogger [
	WCLogger withDefautBackend: 
		(self preferableLoggerBackendClass 
			minLevel: (WCLogEntry levels at: self defaultLogLevel))
]

{ #category : #logging }
WCGlobalSettings class >> logsEnabled [
	^ LogsEnabled ifNil: [ true ]
]

{ #category : #logging }
WCGlobalSettings class >> logsEnabled: aBoolean [
	LogsEnabled := aBoolean
]

{ #category : #accessing }
WCGlobalSettings class >> preferableLoggerBackendClass [
	^ PreferableLoggerBackendClass ifNil: [ PreferableLoggerBackendClass := WCNullLoggerBackend ]
]

{ #category : #accessing }
WCGlobalSettings class >> preferableLoggerBackendClass: aLoggerBackendClass [
	PreferableLoggerBackendClass := aLoggerBackendClass.
	self initLogger.
]

{ #category : #settings }
WCGlobalSettings class >> preferencesOn: aBuilder [
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
				domainValues: (WCLogger availableBackends collect: [ :aClass | aClass name -> aClass ]);
				description: 'Choose which default backend to be used for logging'.
				
			(aBuilder pickOne: #defaultLogLevel)
				order: 7;
				target: self;
				label: 'Default Log Level';
				domainValues: (WCLogEntry levels associations collect: [ :assoc | (assoc key -> assoc key) ]);
				description: 'Choose which level to be used for logging'.
			
			 ]
]
