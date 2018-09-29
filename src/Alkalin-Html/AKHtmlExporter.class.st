Class {
	#name : #AKHtmlExporter,
	#superclass : #Object,
	#category : #'Alkalin-Html-Exporter'
}

{ #category : #'as yet unclassified' }
AKHtmlExporter class >> export: anElement inFile: aFileName [
	self
		writeIn: aFileName
		contents:
			(AKHtmlRenderer new
				visit: anElement;
				yourself) stream contents
]

{ #category : #'as yet unclassified' }
AKHtmlExporter class >> withFile: fileName do: aBlock [
	FileStream newFileNamed: fileName do: aBlock
]

{ #category : #'as yet unclassified' }
AKHtmlExporter class >> writeIn: fileName contents: aString [
	self withFile: fileName do: [ : fileStream | 
		fileStream nextPutAll: aString].
]
