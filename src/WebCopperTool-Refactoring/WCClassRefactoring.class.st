Class {
	#name : #WCClassRefactoring,
	#superclass : #Object,
	#category : #'WebCopperTool-Refactoring'
}

{ #category : #sources }
WCClassRefactoring class >> renamePrefix: oldPrefix to: newPrefix inPackagesNamed: aPackageRegex [
	| packages |
	
	packages := WCPackageRefactoring findPackagesByRegex: aPackageRegex.
	packages do: [ :aRPackage | 
		
		aRPackage classes
		select: [ :each | each name beginsWith: oldPrefix ]
		thenDo: [ :each | 
			| newClassName |
			
			newClassName := (newPrefix , (each name allButFirst: oldPrefix size)) asSymbol.
			Transcript crShow: '[' , self name , '] ' , 'rename class ' , each name , ' to ' , newClassName.
			
			"rename class"
			(RBRenameClassRefactoring rename: each to: newClassName) execute.
			"rename class name in method sources"
			WCMethodRefactoring replaceInSourcePrefix: each name to: newClassName inPackagesNamed: aPackageRegex.
			"rename variable names in method sources"
			WCMethodRefactoring replaceInSourcePrefix: ('an',each name) to: ('a',newClassName) inPackagesNamed: aPackageRegex.
			"rename strings with space in method sources"
			WCMethodRefactoring replaceInSourcePrefix: ('an ',each name) to: ('a ',newClassName) inPackagesNamed: aPackageRegex.
			"rename conversion methods"
			WCMethodRefactoring renamePrefix: ('as',each name) to: ('as',newClassName) inPackagesNamed: aPackageRegex.
			"rename testing methods"
			WCMethodRefactoring renamePrefix: ('is',each name) to: ('is',newClassName) inPackagesNamed: aPackageRegex.
			].
		
		"rename variable names with prefix in method sources"
		WCMethodRefactoring replaceInSourcePrefix: ('an',oldPrefix) to: ('a',newPrefix) inPackagesNamed: aPackageRegex.
		"rename conversion methods"
		WCMethodRefactoring renamePrefix: ('as',oldPrefix) to: ('as',newPrefix) inPackagesNamed: aPackageRegex.
		
		
		]
]
