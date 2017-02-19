" Vim syntax file
" Language:	TWiki
" Maintainer:	Simon Clift <ssclift@math.uwaterlooNOSPAMEH.ca>
" Last Change:	2006 Aug 21
" Remark:	(cfl) - fixed bold, italic, ... issues, 
"                     - linked to the html equivalent highlights,
"                     - fixed spell checking
"                     - fixed twiki word parsing, support for ! and
"                       <noautolink>
"                     - fixed variable recognition
"                     - fixed recursion of certain patterns
"                     - added support for c, java, php, python, ...: use 
"                       <verbatim lang=java>java code </verbatim>
"                       <verbatim lang=c>c,c++ code </verbatim>
"                       <verbatim lang=cpp>c,c++ code </verbatim>
"                       <verbatim lang=python>python code </verbatim>
"                       <verbatim lang=php>php code </verbatim>
"                       <verbatim lang=sql>sql code </verbatim>
"                       <verbatim lang=plsql>sql code </verbatim>
"                       <verbatim lang=perl>perl code </verbatim>
"                       <verbatim lang=make>makefiles </verbatim>
"                       <verbatim lang=tcl>tcl code </verbatim>
"                       <verbatim lang=C#>C# code </verbatim>
"                       <verbatim lang=csharp>C# code </verbatim>
"                       <verbatim lang=html>html (including scripts, php, ...)</verbatim>
"                       <verbatim lang=xml>xml</verbatim>
"                     - added support for <dot> (DirectedGraphPlugin)
"                     - added support for end notes {{ }} (EndNotesPlugin)
"                     - added support for latex math plugin (LatexPlugin),
"                       i.e. %$ $%  and %\[ \]% and MATHMODE, BEGINLATEX and
"                       ENDLATEX
"                     - added support for code beautifier plugin %CODE{""}%,
"                       so far supports java, cpp (used for c too), php3, python,
"                       plsql (usable for most sql), php3, tcl, make, csharp,
"                       xml

" Setup
if version >= 600
  if exists("b:current_syntax")
    finish
  endif
else
  syntax clear
endif

" add the HTML syntax
runtime! syntax/html.vim
unlet b:current_syntax

" Wiki variables and the like are case sensitive

syn case match

" Wiki Names (straight from the sources)
syntax match twikiPageName "^\<\([A-Z][A-Za-z0-9_]*\.\)*[A-Z]\+[a-z]\+[A-Z][A-Z0-9a-z]*\(#[A-Za-z0-9]*\)\?\>"
syntax match twikiPageName "[^!]\<\([A-Z][A-Za-z0-9_]*\.\)*[A-Z]\+[a-z]\+[A-Z][A-Z0-9a-z]*\(#[A-Za-z0-9]*\)\?\>"ms=s+1
syntax match twikiAutoLink "\<\(http\|ftp\|https\|gopher\|news\|file\|telnet\|mailto\|irc\):[^ \t<>\"]\+[^\t *.,!?;:]"
syntax match twikiAnchor "^#[A-Za-z0-9]\+"
syntax region twikiPageLink start=/^\[\[/ start=/[^!]\[\[/ms=s+1 end=/\]\]/ oneline

" Base constructs
syntax match twikiBulletPoint  "^\(   \)\+\* "me=e-1
syntax match twikiListNumber   "^\(   \)\+\(1\.\?\|[iIaA]\.\)\s"me=e-1
syntax region twikiDefList      start="^\(   \)\+\$" end=": " oneline contains=@htmlTop,@twikiTop
syntax match twikiSeparator    "^---\+"

" Text highlighting
syntax region twikiBFixFormat     start="[ \t(]==\S"ms=s+1 start="^==\S" end="\S==$" end="\S==[ \t,.:;!?)]"me=e-1 keepend oneline contains=@htmlTop,@NoSpell
syntax region twikiFixFormat      start="[ \t(]=\S"ms=s+1  start="^=\S"  end="\S=$"  end="\S=[ \t,.:;!?)]"me=e-1  keepend oneline contains=@htmlTop,@NoSpell
syntax region twikiBoldItalFormat start="[ \t(]__\S"ms=s+1 start="^__\S" end="\S__$" end="\S__[ \t,.:;!?)]"me=e-1 keepend oneline contains=@htmlTop
syntax region twikiItalFormat     start="[ \t(]_\S"ms=s+1  start="^_\S"  end="\S_$"  end="\S_[ \t,.:;!?)]"me=e-1  keepend oneline contains=@htmlTop
syntax region twikiBoldFormat     start="[ \t(]\*\S"ms=s+1 start="^\*\S" end="\S\*$" end="\S\*[ \t,.:;!?)]"me=e-1 keepend oneline contains=@htmlTop
syntax match twikiBFixFormat /^==\S==$/
syntax match twikiBFixFormat /[ \t(]==\S==$/ms=s+1
syntax match twikiBFixFormat /^==\S==[ \t,.:;!?)]/me=e-1
syntax match twikiBFixFormat /[ \t(]==\S==[ \t,.:;!?)]/ms=s+1,me=e-1
syntax match twikiFixFormat /^=\S=$/
syntax match twikiFixFormat /[ \t(]=\S=$/ms=s+1
syntax match twikiFixFormat /^=\S=[ \t,.:;!?)]/me=e-1
syntax match twikiFixFormat /[ \t(]=\S=[ \t,.:;!?)]/ms=s+1,me=e-1
syntax match twikiItalFormat /^_\S_$/
syntax match twikiItalFormat /[ \t(]_\S_$/ms=s+1
syntax match twikiItalFormat /^_\S_[ \t,.:;!?)]/me=e-1
syntax match twikiItalFormat /[ \t(]_\S_[ \t,.:;!?)]/ms=s+1,me=e-1
syntax match twikiBoldItalFormat /^__\S__$/
syntax match twikiBoldItalFormat /[ \t(]__\S__$/ms=s+1
syntax match twikiBoldItalFormat /^__\S__[ \t,.:;!?)]/me=e-1
syntax match twikiBoldItalFormat /[ \t(]__\S__[ \t,.:;!?)]/ms=s+1,me=e-1
syntax match twikiBoldFormat /^\*\S\*$/
syntax match twikiBoldFormat /[ \t(]\*\S\*$/ms=s+1
syntax match twikiBoldFormat /^\*\S\*[ \t,.:;!?)]/me=e-1
syntax match twikiBoldFormat /[ \t(]\*\S\*[ \t,.:;!?)]/ms=s+1,me=e-1

" end notes
syn cluster twikiTop contains=twikiBoldFormat,twikiItalFormat,twikiBoldItalFormat,twikiFixFormat,twikiBFixFormat,twikiListNumber,twikiBulletPoint,twikiDefList,twikiSeparator,twikiPageLink,twikiAnchor,twikiVar,twikiComplexVar,twikiEndNote,twikiAutoLink
syntax region twikiEndNote start="{{" end="}}" oneline keepend contains=@Spell,@htmlTop,@twikiTop,twikiPageName

" Titles
syntax region twikiTitle1  start=/^---\(+\{1}\|#\{1}\) / end=/$/ contains=@Spell,@htmlTop,@twikiTop,twikiPageName
syntax region twikiTitle2  start=/^---\(+\{2}\|#\{2}\) / end=/$/ contains=@Spell,@htmlTop,@twikiTop,twikiPageName
syntax region twikiTitle3  start=/^---\(+\{3}\|#\{3}\) / end=/$/ contains=@Spell,@htmlTop,@twikiTop,twikiPageName
syntax region twikiTitle4  start=/^---\(+\{4}\|#\{4}\) / end=/$/ contains=@Spell,@htmlTop,@twikiTop,twikiPageName
syntax region twikiTitle5  start=/^---\(+\{5}\|#\{5}\) / end=/$/ contains=@Spell,@htmlTop,@twikiTop,twikiPageName
syntax region twikiTitle6  start=/^---\(+\{6}\|#\{6}\) / end=/$/ contains=@Spell,@htmlTop,@twikiTop,twikiPageName

syntax region twikiTitle1NP  start=/^---\(+\{1}\|#\{1}\) / end=/$/ contained contains=@Spell,@htmlTop,@twikiTop
syntax region twikiTitle2NP  start=/^---\(+\{2}\|#\{2}\) / end=/$/ contained contains=@Spell,@htmlTop,@twikiTop
syntax region twikiTitle3NP  start=/^---\(+\{3}\|#\{3}\) / end=/$/ contained contains=@Spell,@htmlTop,@twikiTop
syntax region twikiTitle4NP  start=/^---\(+\{4}\|#\{4}\) / end=/$/ contained contains=@Spell,@htmlTop,@twikiTop
syntax region twikiTitle5NP  start=/^---\(+\{5}\|#\{5}\) / end=/$/ contained contains=@Spell,@htmlTop,@twikiTop
syntax region twikiTitle6NP  start=/^---\(+\{6}\|#\{6}\) / end=/$/ contained contains=@Spell,@htmlTop,@twikiTop


" TWiki variables that are built-in or known in the standard
setlocal iskeyword+=%

" other unkown twiki variables
syntax match twikiComplexVar /[^!]%[a-zA-Z][a-zA-Z0-9_]*%/ms=s+1
syntax match twikiComplexVar /^%[a-zA-Z][a-zA-Z0-9_]*%/
syntax region twikiComplexVar start=/^%[a-zA-Z][a-zA-Z0-9_]*{/ start=/[^!]%[a-zA-Z][a-zA-Z0-9_]*{/ms=s+1 end=/}%/ keepend


highlight link twikiComplexVar twikiVar

syn region twikiNoLink matchgroup=twikiSpecial start="<noautolink>" matchgroup=twikiSpecial end="</noautolink>" keepend contains=@Spell,@htmlTop,@twikiTop,twikiTitle.*NP

syntax include @twikiDotInclude syntax/dot.vim
unlet b:current_syntax
syn region twikiDot start="<dot>" end="</dot>" keepend contains=@twikiDotInclude

syntax include @twikiCInclude syntax/c.vim
unlet b:current_syntax
syn region twikiVerbatimC matchgroup=twikiVerbatim start="<verbatim lang=\(c\|cpp\)>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiCInclude
syn region twikiVerbatimC matchgroup=twikiVerbatim start="%CODE{\"cpp\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiCInclude

syntax include @twikiJavaInclude syntax/java.vim
unlet b:current_syntax
syn region twikiVerbatimJava matchgroup=twikiVerbatim start="<verbatim lang=java>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiJavaInclude
syn region twikiVerbatimJava matchgroup=twikiVerbatim start="%CODE{\"java\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiJavaInclude

syntax include @twikiPhpInclude syntax/php.vim
unlet b:current_syntax
syn region twikiVerbatimPhp matchgroup=twikiVerbatim start="<verbatim lang=php[34]*>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@phpClTop
syn region twikiVerbatimPhp matchgroup=twikiVerbatim start="%CODE{\"php3\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@phpClTop

syntax include @twikiPythonInclude syntax/python.vim
unlet b:current_syntax
syn region twikiVerbatimPython matchgroup=twikiVerbatim start="<verbatim lang=python>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiPythonInclude
syn region twikiVerbatimPython matchgroup=twikiVerbatim start="%CODE{\"python\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiPythonInclude

syntax include @twikiSqlInclude syntax/sql.vim
unlet b:current_syntax
syn region twikiVerbatimSql matchgroup=twikiVerbatim start="<verbatim lang=\(pl\)\?sql>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiSqlInclude
syn region twikiVerbatimSql matchgroup=twikiVerbatim start="%CODE{\"plsql\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiSqlInclude

syntax include @twikiTclInclude syntax/tcl.vim
unlet b:current_syntax
syn region twikiVerbatimTcl matchgroup=twikiVerbatim start="<verbatim lang=tcl>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiTclInclude
syn region twikiVerbatimTcl matchgroup=twikiVerbatim start="%CODE{\"tcl\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiTclInclude

syntax include @twikiPerlInclude syntax/perl.vim
unlet b:current_syntax
syn region twikiVerbatimPerl matchgroup=twikiVerbatim start="<verbatim lang=perl>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiPerlInclude
syn region twikiVerbatimPerl matchgroup=twikiVerbatim start="%CODE{\"perl\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiPerlInclude

syntax include @twikiMakeInclude syntax/make.vim
unlet b:current_syntax
syn region twikiVerbatimMake matchgroup=twikiVerbatim start="<verbatim lang=make>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiMakeInclude
syn region twikiVerbatimMake matchgroup=twikiVerbatim start="%CODE{\"make\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiMakeInclude

syntax include @twikiCsInclude syntax/cs.vim
unlet b:current_syntax
syn region twikiVerbatimCs matchgroup=twikiVerbatim start="<verbatim lang=\(C#\|csharp\)>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiCsInclude
syn region twikiVerbatimCs matchgroup=twikiVerbatim start="%CODE{\"csharp\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiCsInclude

syntax include @twikiXMLInclude syntax/xml.vim
unlet b:current_syntax
syn region twikiVerbatimXML matchgroup=twikiVerbatim start="<verbatim lang=xml>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@twikiXMLInclude
syn region twikiVerbatimXML matchgroup=twikiVerbatim start="%CODE{\"xml\"}%" matchgroup=twikiVerbatim end="%ENDCODE%" keepend contains=@twikiXMLInclude

syn region twikiVerbatimHtml matchgroup=twikiVerbatim start="<verbatim lang=html>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=@htmlTop


syntax include @twikiTexInclude syntax/tex.vim
unlet b:current_syntax
syn region twikiTex matchgroup=twikiVerbatim start="%\$" matchgroup=twikiVerbatim end="\$%" keepend oneline contains=@texMathZoneGroup
syn region twikiTex matchgroup=twikiVerbatim start="%MATHMODE{" matchgroup=twikiVerbatim end="}%" keepend contains=@texMathZoneGroup
syn region twikiTex matchgroup=twikiVerbatim start="%\\\[" matchgroup=twikiVerbatim end="\\\]%" keepend contains=@texMathZoneGroup
syn region twikiTex matchgroup=twikiVerbatim start="%BEGINLATEX%" matchgroup=twikiVerbatim end="%ENDLATEX%" keepend contains=@twikiTexInclude

syn region twikiVerbatimNothing matchgroup=twikiVerbatim start="<verbatim>" matchgroup=twikiVerbatim end="</verbatim>" keepend contains=twikiNothing

" avoid problems with <?php
syn match twikiIgnore "<?" 

" links

" Define the default highlighting
if version >= 508 || !exists("did_inittab_syntax_inits")
  if version < 508
    let did_inittab_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink twikiBulletPoint  Type
  HiLink twikiListNumber   Type
  HiLink twikiDefList      Type
  HiLink twikiSeparator    Type

  HiLink twikiFixFormat    String
  HiLink twikiBFixFormat   String
  HiLink twikiBoldFormat   htmlBold
  HiLink twikiItalFormat      htmlItalic
  HiLink twikiBoldItalFormat  htmlBoldItalic

  HiLink twikiTitle1       htmlH1
  HiLink twikiTitle2       htmlH2
  HiLink twikiTitle3       htmlH3
  HiLink twikiTitle4       htmlH4
  HiLink twikiTitle5       htmlH5
  HiLink twikiTitle6       htmlH6
  HiLink twikiTitle1NP     htmlH1
  HiLink twikiTitle2NP     htmlH2
  HiLink twikiTitle3NP     htmlH3
  HiLink twikiTitle4NP     htmlH4
  HiLink twikiTitle5NP     htmlH5
  HiLink twikiTitle6NP     htmlH6

  HiLink twikiVar          Macro

  HiLink twikiPageName     htmlLink
  HiLink twikiAutoLink     htmlLink
  HiLink twikiAnchor       Constant
  HiLink twikiPageLink     htmlLink

  HiLink twikiSpecial      Special
  HiLink twikiDot          Special
  HiLink twikiVerbatim     Special
  HiLink twikiEndNote      Constant

  delcommand HiLink
endif


let b:current_syntax = "twiki"
