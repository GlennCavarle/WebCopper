Class {
	#name : #WCHtmlExporter,
	#superclass : #Object,
	#category : #'WebCopper-Html-Exporter'
}

{ #category : #'as yet unclassified' }
WCHtmlExporter class >> export: anElement inFile: aFileName [
	self
		writeIn: aFileName
		contents:
			(WCHtmlRenderer new
				visit: anElement;
				yourself) stream contents
]

{ #category : #'as yet unclassified' }
WCHtmlExporter class >> withFile: fileName do: aBlock [
	FileStream newFileNamed: fileName do: aBlock
]

{ #category : #'as yet unclassified' }
WCHtmlExporter class >> writeIn: fileName contents: aString [
	self withFile: fileName do: [ : fileStream | 
		fileStream nextPutAll: aString].
]
