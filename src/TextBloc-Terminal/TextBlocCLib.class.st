Class {
	#name : #TextBlocCLib,
	#superclass : #FFILibrary,
	#classInstVars : [
		'instance'
	],
	#category : #'TextBloc-Terminal'
}

{ #category : #'instance creation' }
TextBlocCLib class >> compile [
	|cmd arch st fp libfile ofile|
	fp := self mksource.
	ofile := fp parent / 'textBlocCLib.o'.
	libfile := fp parent / 'textBlocCLib.flib'.
	arch := Smalltalk vm wordSize = 8 ifTrue: [ '-m64' ] ifFalse: [ '-m32' ].
	cmd := 'gcc -c -fpic ', arch, ' "', fp pathString, '" -o "', ofile pathString, '"'.
	Transcript show: 'Building: ', cmd; cr.
	st := LibC system: cmd.
	st = 0 ifFalse: [ ^self error:'LibC Cannot create object file' ].
	cmd := 'gcc -shared ', arch, ' -o "',libfile pathString,'" "', ofile pathString, '"'.
	Transcript show: 'Building: ', cmd; cr.
	st := LibC system: cmd. 
	st = 0 ifFalse: [ ^self error:'LibC Cannot create shared file' ].
	fp exists ifTrue:[ fp delete ].
	ofile asFileReference delete
]

{ #category : #'instance creation' }
TextBlocCLib class >> mksource [
	|file stream|
	file := ('./' asFileReference absolutePath / 'textBlocCLib.c') asFileReference.
	file exists ifTrue:[ file delete ].
	stream := file writeStream.
	stream nextPutAll: self source.
	stream close.
	^file
]

{ #category : #'instance creation' }
TextBlocCLib class >> singleton [ 
	^ self uniqueInstance 
]

{ #category : #'instance creation' }
TextBlocCLib class >> source [
	^ '
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>

struct termios orig_termios;

void disableRawMode() {
  tcsetattr(STDIN_FILENO, TCSAFLUSH, &orig_termios);
}

void enableRawMode() {
  tcgetattr(STDIN_FILENO, &orig_termios);
  atexit(disableRawMode);
  struct termios raw = orig_termios;
  raw.c_lflag &= ~(ECHO | ICANON);
  tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw);
}
'
]

{ #category : #'accessing platform' }
TextBlocCLib >> disableRawMode [
	^ self ffiCall: #(void disableRawMode())
]

{ #category : #'accessing platform' }
TextBlocCLib >> enableRawMode [
	^ self ffiCall: #(void enableRawMode()) 
]

{ #category : #'accessing platform' }
TextBlocCLib >> unix64ModuleName [

	^ (('./' asFileReference absolutePath) / 'textBlocCLib.flib') asFileReference pathString
]

{ #category : #'accessing platform' }
TextBlocCLib >> unixModuleName [
self halt.
	^ (('./' asFileReference absolutePath) / 'textBlocCLib.flib') asFileReference pathString
]
