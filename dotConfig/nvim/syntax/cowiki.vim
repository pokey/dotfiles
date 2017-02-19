" Vim syntax file
" Language:	onconfluence
" Maintainer:	Claudio Fleiner
" Last Change:	2008 Jun 4
" Remark:	

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
" syntax match cowikiPageName "^\<\([A-Z][A-Za-z0-9_]*\.\)*[A-Z]\+[a-z]\+[A-Z][A-Z0-9a-z]*\(#[A-Za-z0-9]*\)\?\>"
" syntax match cowikiPageName "[^!]\<\([A-Z][A-Za-z0-9_]*\.\)*[A-Z]\+[a-z]\+[A-Z][A-Z0-9a-z]*\(#[A-Za-z0-9]*\)\?\>"ms=s+1
" syntax match cowikiAutoLink "\<\(http\|ftp\|https\|gopher\|news\|file\|telnet\|mailto\|irc\):[^ \t<>\"]\+[^\t *.,!?;:]"
" syntax match cowikiAnchor "^#[A-Za-z0-9]\+"
syntax region cowikiPageLink start=/\[/ end=/\]/ oneline

" Base constructs
" syntax match cowikiBulletPoint  "^\(   \)\+\* "me=e-1
" syntax match cowikiListNumber   "^\(   \)\+\(1\.\?\|[iIaA]\.\)\s"me=e-1
" syntax region cowikiDefList      start="^\(   \)\+\$" end=": " oneline contains=@htmlTop,@cowikiTop
" syntax match cowikiSeparator    "^---\+"

" Text highlighting
" syntax region cowikiBFixFormat     start="[ \t(]==\S"ms=s+1 start="^==\S" end="\S==$" end="\S==[ \t,.:;!?)]"me=e-1 keepend oneline contains=@htmlTop,@NoSpell
" syntax region cowikiFixFormat      start="[ \t(]=\S"ms=s+1  start="^=\S"  end="\S=$"  end="\S=[ \t,.:;!?)]"me=e-1  keepend oneline contains=@htmlTop,@NoSpell
" syntax region cowikiBoldItalFormat start="[ \t(]__\S"ms=s+1 start="^__\S" end="\S__$" end="\S__[ \t,.:;!?)]"me=e-1 keepend oneline contains=@htmlTop
" syntax region cowikiItalFormat     start="[ \t(]_\S"ms=s+1  start="^_\S"  end="\S_$"  end="\S_[ \t,.:;!?)]"me=e-1  keepend oneline contains=@htmlTop
" syntax region cowikiBoldFormat     start="[ \t(]\*\S"ms=s+1 start="^\*\S" end="\S\*$" end="\S\*[ \t,.:;!?)]"me=e-1 keepend oneline contains=@htmlTop
" syntax match cowikiBFixFormat /^==\S==$/
" syntax match cowikiBFixFormat /[ \t(]==\S==$/ms=s+1
" syntax match cowikiBFixFormat /^==\S==[ \t,.:;!?)]/me=e-1
" syntax match cowikiBFixFormat /[ \t(]==\S==[ \t,.:;!?)]/ms=s+1,me=e-1
" syntax match cowikiFixFormat /^=\S=$/
" syntax match cowikiFixFormat /[ \t(]=\S=$/ms=s+1
" syntax match cowikiFixFormat /^=\S=[ \t,.:;!?)]/me=e-1
" syntax match cowikiFixFormat /[ \t(]=\S=[ \t,.:;!?)]/ms=s+1,me=e-1
" syntax match cowikiItalFormat /^_\S_$/
" syntax match cowikiItalFormat /[ \t(]_\S_$/ms=s+1
" syntax match cowikiItalFormat /^_\S_[ \t,.:;!?)]/me=e-1
" syntax match cowikiItalFormat /[ \t(]_\S_[ \t,.:;!?)]/ms=s+1,me=e-1
" syntax match cowikiBoldItalFormat /^__\S__$/
" syntax match cowikiBoldItalFormat /[ \t(]__\S__$/ms=s+1
" syntax match cowikiBoldItalFormat /^__\S__[ \t,.:;!?)]/me=e-1
" syntax match cowikiBoldItalFormat /[ \t(]__\S__[ \t,.:;!?)]/ms=s+1,me=e-1
syntax match cowikiBoldFormat /\*[^*]*\*/
syntax match cowikiItalFormat /_[^_]*_/
syntax region cowikiFixFormat start="{{" end="}}" oneline keepend
" syntax match cowikiBoldFormat /[ \t(]\*\S\*$/ms=s+1
" syntax match cowikiBoldFormat /^\*\S\*[ \t,.:;!?)]/me=e-1
" syntax match cowikiBoldFormat /[ \t(]\*\S\*[ \t,.:;!?)]/ms=s+1,me=e-1

" end notes
" syn cluster cowikiTop contains=cowikiBoldFormat,cowikiItalFormat,cowikiBoldItalFormat,cowikiFixFormat,cowikiBFixFormat,cowikiListNumber,cowikiBulletPoint,cowikiDefList,cowikiSeparator,cowikiPageLink,cowikiAnchor,cowikiVar,cowikiComplexVar,cowikiEndNote,cowikiAutoLink
" syntax region cowikiEndNote start="{{" end="}}" oneline keepend contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName

" Titles
syntax region cowikiTitle1  start=/^h1\. / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
syntax region cowikiTitle2  start=/^h2\. / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
syntax region cowikiTitle3  start=/^h3\. / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
syntax region cowikiTitle4  start=/^h4\. / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
syntax region cowikiTitle5  start=/^h5\. / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
syntax region cowikiTitle6  start=/^h6\. / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
" syntax region cowikiTitle2  start=/^---\(+\{2}\|#\{2}\) / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
" syntax region cowikiTitle3  start=/^---\(+\{3}\|#\{3}\) / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
" syntax region cowikiTitle4  start=/^---\(+\{4}\|#\{4}\) / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
" syntax region cowikiTitle5  start=/^---\(+\{5}\|#\{5}\) / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
" syntax region cowikiTitle6  start=/^---\(+\{6}\|#\{6}\) / end=/$/ contains=@Spell,@htmlTop,@cowikiTop,cowikiPageName
" 
" syntax region cowikiTitle1NP  start=/^---\(+\{1}\|#\{1}\) / end=/$/ contained contains=@Spell,@htmlTop,@cowikiTop
" syntax region cowikiTitle2NP  start=/^---\(+\{2}\|#\{2}\) / end=/$/ contained contains=@Spell,@htmlTop,@cowikiTop
" syntax region cowikiTitle3NP  start=/^---\(+\{3}\|#\{3}\) / end=/$/ contained contains=@Spell,@htmlTop,@cowikiTop
" syntax region cowikiTitle4NP  start=/^---\(+\{4}\|#\{4}\) / end=/$/ contained contains=@Spell,@htmlTop,@cowikiTop
" syntax region cowikiTitle5NP  start=/^---\(+\{5}\|#\{5}\) / end=/$/ contained contains=@Spell,@htmlTop,@cowikiTop
" syntax region cowikiTitle6NP  start=/^---\(+\{6}\|#\{6}\) / end=/$/ contained contains=@Spell,@htmlTop,@cowikiTop


" TWiki variables that are built-in or known in the standard
" setlocal iskeyword+=%

" other unkown cowiki variables
" syntax match cowikiComplexVar /[^!]%[a-zA-Z][a-zA-Z0-9_]*%/ms=s+1
" syntax match cowikiComplexVar /^%[a-zA-Z][a-zA-Z0-9_]*%/
" syntax region cowikiComplexVar start=/^%[a-zA-Z][a-zA-Z0-9_]*{/ start=/[^!]%[a-zA-Z][a-zA-Z0-9_]*{/ms=s+1 end=/}%/ keepend


" highlight link cowikiComplexVar cowikiVar

" syn region cowikiNoLink matchgroup=cowikiSpecial start="<noautolink>" matchgroup=cowikiSpecial end="</noautolink>" keepend contains=@Spell,@htmlTop,@cowikiTop,cowikiTitle.*NP

" syntax include @cowikiDotInclude syntax/dot.vim
" unlet b:current_syntax
" syn region cowikiDot start="<dot>" end="</dot>" keepend contains=@cowikiDotInclude

" syntax include @cowikiCInclude syntax/c.vim
" unlet b:current_syntax
" syn region cowikiVerbatimC matchgroup=cowikiVerbatim start="<verbatim lang=\(c\|cpp\)>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiCInclude
" syn region cowikiVerbatimC matchgroup=cowikiVerbatim start="%CODE{\"cpp\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiCInclude

" syntax include @cowikiJavaInclude syntax/java.vim
" unlet b:current_syntax
" syn region cowikiVerbatimJava matchgroup=cowikiVerbatim start="<verbatim lang=java>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiJavaInclude
" syn region cowikiVerbatimJava matchgroup=cowikiVerbatim start="%CODE{\"java\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiJavaInclude

" syntax include @cowikiPhpInclude syntax/php.vim
" unlet b:current_syntax
" syn region cowikiVerbatimPhp matchgroup=cowikiVerbatim start="<verbatim lang=php[34]*>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@phpClTop
" syn region cowikiVerbatimPhp matchgroup=cowikiVerbatim start="%CODE{\"php3\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@phpClTop

" syntax include @cowikiPythonInclude syntax/python.vim
" unlet b:current_syntax
" syn region cowikiVerbatimPython matchgroup=cowikiVerbatim start="<verbatim lang=python>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiPythonInclude
" syn region cowikiVerbatimPython matchgroup=cowikiVerbatim start="%CODE{\"python\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiPythonInclude

" syntax include @cowikiSqlInclude syntax/sql.vim
" unlet b:current_syntax
" syn region cowikiVerbatimSql matchgroup=cowikiVerbatim start="<verbatim lang=\(pl\)\?sql>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiSqlInclude
" syn region cowikiVerbatimSql matchgroup=cowikiVerbatim start="%CODE{\"plsql\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiSqlInclude

" syntax include @cowikiTclInclude syntax/tcl.vim
" unlet b:current_syntax
" syn region cowikiVerbatimTcl matchgroup=cowikiVerbatim start="<verbatim lang=tcl>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiTclInclude
" syn region cowikiVerbatimTcl matchgroup=cowikiVerbatim start="%CODE{\"tcl\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiTclInclude

" syntax include @cowikiPerlInclude syntax/perl.vim
" unlet b:current_syntax
" syn region cowikiVerbatimPerl matchgroup=cowikiVerbatim start="<verbatim lang=perl>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiPerlInclude
" syn region cowikiVerbatimPerl matchgroup=cowikiVerbatim start="%CODE{\"perl\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiPerlInclude

" syntax include @cowikiMakeInclude syntax/make.vim
" unlet b:current_syntax
" syn region cowikiVerbatimMake matchgroup=cowikiVerbatim start="<verbatim lang=make>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiMakeInclude
" syn region cowikiVerbatimMake matchgroup=cowikiVerbatim start="%CODE{\"make\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiMakeInclude

" syntax include @cowikiCsInclude syntax/cs.vim
" unlet b:current_syntax
" syn region cowikiVerbatimCs matchgroup=cowikiVerbatim start="<verbatim lang=\(C#\|csharp\)>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiCsInclude
" syn region cowikiVerbatimCs matchgroup=cowikiVerbatim start="%CODE{\"csharp\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiCsInclude

" syntax include @cowikiXMLInclude syntax/xml.vim
" unlet b:current_syntax
" syn region cowikiVerbatimXML matchgroup=cowikiVerbatim start="<verbatim lang=xml>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@cowikiXMLInclude
" syn region cowikiVerbatimXML matchgroup=cowikiVerbatim start="%CODE{\"xml\"}%" matchgroup=cowikiVerbatim end="%ENDCODE%" keepend contains=@cowikiXMLInclude

" syn region cowikiVerbatimHtml matchgroup=cowikiVerbatim start="<verbatim lang=html>" matchgroup=cowikiVerbatim end="</verbatim>" keepend contains=@htmlTop


" syntax include @cowikiTexInclude syntax/tex.vim
" unlet b:current_syntax
" syn region cowikiTex matchgroup=cowikiVerbatim start="%\$" matchgroup=cowikiVerbatim end="\$%" keepend oneline contains=@texMathZoneGroup
" syn region cowikiTex matchgroup=cowikiVerbatim start="%MATHMODE{" matchgroup=cowikiVerbatim end="}%" keepend contains=@texMathZoneGroup
" syn region cowikiTex matchgroup=cowikiVerbatim start="%\\\[" matchgroup=cowikiVerbatim end="\\\]%" keepend contains=@texMathZoneGroup
" syn region cowikiTex matchgroup=cowikiVerbatim start="%BEGINLATEX%" matchgroup=cowikiVerbatim end="%ENDLATEX%" keepend contains=@cowikiTexInclude

syn region cowikiVerbatimNothing matchgroup=cowikiVerbatim start="{code[^}]*}" matchgroup=cowikiVerbatim end="{code}" keepend contains=cowikiNothing

" avoid problems with <?php
" syn match cowikiIgnore "<?" 

" links

" Define the default highlighting
if version >= 508 || !exists("did_inittab_syntax_inits")
  if version < 508
    let did_inittab_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink cowikiBulletPoint  Type
  HiLink cowikiListNumber   Type
  HiLink cowikiDefList      Type
  HiLink cowikiSeparator    Type

  HiLink cowikiFixFormat    String
  HiLink cowikiBFixFormat   String
  HiLink cowikiBoldFormat   htmlBold
  HiLink cowikiItalFormat      htmlItalic
  HiLink cowikiBoldItalFormat  htmlBoldItalic

  HiLink cowikiTitle1       htmlH1
  HiLink cowikiTitle2       htmlH2
  HiLink cowikiTitle3       htmlH3
  HiLink cowikiTitle4       htmlH4
  HiLink cowikiTitle5       htmlH5
  HiLink cowikiTitle6       htmlH6
  HiLink cowikiTitle1NP     htmlH1
  HiLink cowikiTitle2NP     htmlH2
  HiLink cowikiTitle3NP     htmlH3
  HiLink cowikiTitle4NP     htmlH4
  HiLink cowikiTitle5NP     htmlH5
  HiLink cowikiTitle6NP     htmlH6

  HiLink cowikiVar          Macro

  HiLink cowikiPageName     htmlLink
  HiLink cowikiAutoLink     htmlLink
  HiLink cowikiAnchor       Constant
  HiLink cowikiPageLink     htmlLink

  HiLink cowikiSpecial      Special
  HiLink cowikiDot          Special
  HiLink cowikiVerbatim     Special
  HiLink cowikiEndNote      Constant

  delcommand HiLink
endif


let b:current_syntax = "cowiki"
