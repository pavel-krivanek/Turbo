Class {
	#name : #TbCLib,
	#superclass : #FFILibrary,
	#classInstVars : [
		'instance'
	],
	#category : #'Turbo-Terminal'
}

{ #category : #'instance creation' }
TbCLib class >> compile [

	<script>
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
TbCLib class >> mksource [
	|file stream|
	file := ('./' asFileReference absolutePath / 'textBlocCLib.c') asFileReference.
	file exists ifTrue:[ file delete ].
	stream := file writeStream.
	stream nextPutAll: self source.
	stream close.
	^file
]

{ #category : #'instance creation' }
TbCLib class >> singleton [ 
	^ self uniqueInstance 
]

{ #category : #'instance creation' }
TbCLib class >> source [
	^ '
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>
#include <sys/select.h>
#include <sys/time.h>

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

char *peekCharacterNonBlocking() {
    fd_set set;
    struct timeval timeout;

    // Initialize the file descriptor set
    FD_ZERO(&set);
    FD_SET(STDIN_FILENO, &set);

    // Set timeout to 0, making select non-blocking
    timeout.tv_sec = 0;
    timeout.tv_usec = 0;

    // See if there''s input available
    if (select(STDIN_FILENO + 1, &set, NULL, NULL, &timeout) == 1) {
        int ch = getchar();
        ungetc(ch, stdin); // Put the character back

        // Allocate memory for one char and null terminator
        char *result = malloc(2 * sizeof(char));
        if (result != NULL) {
            result[0] = ch;
            result[1] = ''\0'';
            return result;
        }
    }

    return NULL; // No character available or memory allocation failed
}
'
]

{ #category : #'accessing platform' }
TbCLib >> disableRawMode [
	^ self ffiCall: #(void disableRawMode())
]

{ #category : #'accessing platform' }
TbCLib >> enableRawMode [
	^ self ffiCall: #(void enableRawMode()) 
]

{ #category : #'accessing platform' }
TbCLib >> peekCharacterNonBlocking [
	^ self ffiCall: #(char* peekCharacterNonBlocking()) 
]

{ #category : #'accessing platform' }
TbCLib >> unix64ModuleName [

	^ (('./' asFileReference absolutePath) / 'textBlocCLib.flib') asFileReference pathString
]

{ #category : #'accessing platform' }
TbCLib >> unixModuleName [
self halt.
	^ (('./' asFileReference absolutePath) / 'textBlocCLib.flib') asFileReference pathString
]
