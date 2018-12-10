Class {
	#name : #AKMethodRefactoring,
	#superclass : #Object,
	#category : #'AlkalinTool-Refactoring'
}

{ #category : #find }
AKMethodRefactoring class >> findMethodsNamed: aSelectorRegex inPackagesNamed: aPackageRegex [
	| packages result |
	
	result := OrderedCollection new.
	packages := AKPackageRefactoring findPackagesByRegex: aPackageRegex.
	
	packages do: [ :aRPackage | 
		aRPackage methods do: [ :method | 
			(aSelectorRegex asRegex matches: method selector)
				ifTrue: [ result add: method ] ].
		 ].
	
	^ result
]

{ #category : #find }
AKMethodRefactoring class >> findMethodsWhichContain: aString inPackagesNamed: aPackageRegex [
	| packages result |
	
	result := OrderedCollection new.
	packages := AKPackageRefactoring findPackagesByRegex: aPackageRegex.
	
	packages do: [ :aRPackage | 
		aRPackage methods do: [ :method | 
					(method sourceCode includesSubstring: aString caseSensitive: true)
						ifTrue: [ result add: method ] ].
		 ].
	
	^ result
]

{ #category : #sources }
AKMethodRefactoring class >> renamePrefix: oldPrefix to: newPrefix inPackagesNamed: aPackageRegex [
	| methods |
	methods := self findMethodsNamed: (oldPrefix,'.*') inPackagesNamed: aPackageRegex.
	methods do: [ :oldMethod | |newMethodName argumentPermutation|
		newMethodName := (newPrefix,(oldMethod selector allButFirst: oldPrefix size)) asSymbol.
		argumentPermutation := oldMethod argumentNames collect:[:arg| oldMethod argumentNames indexOf: arg].
		
		Transcript crShow: '[' , self name , '] ' , 'rename ' , oldMethod name , ' to ' , newMethodName .
		
		(RBRenameMethodRefactoring 
				renameMethod: oldMethod selector 
				in: oldMethod methodClass 
				to: newMethodName permutation:argumentPermutation) execute
		
		 ]
]

{ #category : #'source refactoring' }
AKMethodRefactoring class >> replaceInSourcePrefix: oldPrefix to: newPrefix inMethod: aCompiledMethod [
	| newSource newMethodNode protocol targetClass |
	protocol := aCompiledMethod protocol.
	targetClass := aCompiledMethod methodClass.
	newSource := aCompiledMethod sourceCode copyReplaceAll: oldPrefix with: newPrefix.
	newMethodNode := RBParser parseMethod: newSource.
	
	(newMethodNode selector ~= aCompiledMethod selector) ifTrue:[
		Transcript crShow: '[' , self name , '][Warning] ' ,'replaceing ',oldPrefix, ' in ', aCompiledMethod name, ' will modify selector, skip'.
		^ self].
	
	Transcript crShow: '[' , self name , '] ' , 'rename prefix ' , oldPrefix , ' to ' , newPrefix , ' in ', aCompiledMethod name.
	
	targetClass compile: newSource classified: protocol
	
		
	
]

{ #category : #'source refactoring' }
AKMethodRefactoring class >> replaceInSourcePrefix: oldPrefix to: newPrefix inPackagesNamed: aPackageRegex [
	| methods |
	methods := self findMethodsWhichContain: oldPrefix inPackagesNamed: aPackageRegex.
	methods do: [ :each | self replaceInSourcePrefix: oldPrefix to: newPrefix inMethod: each ]
]
