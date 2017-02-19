" Vim syntax file
" Language:	DTD for dtd (not sgml)
" Maintainer:	Claudio Fleiner
" URL:		
" Last change:	1999 Dec 

" This syntax file will highlight dtd tags and arguments.
"
syn clear

" Only tags and special chars (&auml;) are highlighted

" mark illegal characters
syn match dtdError "[<>&]"


" special characters
syn match dtdSpecialChar "&[^;]*;"

" The real comments (this implements the comments as defined by dtd,
" but not all dtd pages actually conform to it. Errors are flagged.
syn region dtdComment                start=+<!--+        end=+-->+ 

" String
syn region  xmlString   contained start=+"+ end=+"+ contains=xmlSpecialChar
syn region  xmlString   contained start=+'+ end=+'+ contains=xmlSpecialChar

" special characters
syn match xmlSpecialChar "&[^;]*;"

" DTD
syn region dtdEntity                start=+<!ENTITY+ end=+>+ contains=dtdConstants,dtdEntityName,dtdString 
syn match  dtdEntityName "!ENTITY" nextgroup=dtdElementDef skipwhite contained
syn region dtdElement                start=+<!ELEMENT+ end=+>+ contains=dtdConstants,dtdElementName 
syn match  dtdElementName "!ELEMENT" nextgroup=dtdElementDef skipwhite contained
syn region dtdAttlist                start=+<!ATTLIST+ end=+>+ contains=dtdConstants,dtdString,dtdAttlistName,dtdLang
syn match  dtdAttlistName  "!ATTLIST" nextgroup=dtdElementDef skipwhite contained
syn keyword dtdConstants             EMPTY ALL ID IDREF IDREFS ENTITY ENTITIES NMTOKEN NMTOKENS CDATA  contained
syn match dtdConstants   "#\(PCDATA\|REQUIRED\|IMPLIED\|FIXED\)\>"
syn match dtdElementDef  "[A-Za-z_:][A-Za-z:_.]*" contained
syn match   dtdLang     "\sxml:lang"                   nextgroup=xmlAssignString contained

" synchronizing (does not always work if a comment includes legal
" dtd tags, but doing it right would mean to always start
" at the first line, which is too slow)
syn sync match dtdHighlight groupthere NONE "<[/a-zA-Z]"
syn sync match dtdHighlightSkip "^.*['\"].*$"
syn sync minlines=10

if !exists("did_dtd_syntax_inits")
  let did_dtd_syntax_inits = 1
  " The default methods for highlighting.  Can be overridden later
  hi link dtdElement                   Statement
  hi link dtdElementName               Statement
  hi link dtdAttlist                   Type
  hi link dtdAttlistName               Type
  hi link dtdConstants                 Boolean
  hi link dtdElementDef                Statement
  hi link dtdString                    String
  hi link dtdDeclaration               Function
  hi link dtdEntity                    Special
  hi link dtdEntityName                Special
  hi link dtdLang                      Constant

  hi link dtdSpecialChar               Special
  hi link dtdComment                   Comment
  hi link dtdError			Error

endif

let b:current_syntax = "dtd"

" vim: ts=8
