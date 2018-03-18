augroup win
   au!
   au WinEnter * :AddExtraWidth
augroup end

augroup bufwrite
   au!
   au BufWritePost * Neomake
   au BufReadPost * Neomake
augroup end

augroup termenter
   au!
   au BufEnter term://* MaybeEnterTerm
augroup end

augroup tabs
  au!
  au FileType make setlocal noexpandtab
  au FileType snippets setlocal noexpandtab
  au BufRead,BufNewFile *.java setlocal softtabstop=2 shiftwidth=2 expandtab
  au BufRead,BufNewFile *.otl setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
  au FileType python
    \ setlocal tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ smarttab
    \ expandtab
augroup end

augroup gzip
  au!
  au BufReadPost *.httplog.gz set bin | '[,']!gunzip
  au BufReadPost *.httplog.gz set nobin | set readonly
  au BufReadPost *.httplog.gz set filetype=httplog
  au BufWritePost,FileWritePost	*.httplog.gz !mv <afile> <afile>:r
  au BufWritePost,FileWritePost	*.httplog.gz !gzip -9 <afile>:r
augroup end

" Filetypes
augroup filetypes
  au!
  au BufNewFile,BufRead *.m                    set ft=objc
  au BufRead,BufNewFile *.scss                 set ft=scss
  au BufRead,BufNewFile .*gdb*                 set ft=gdb
  au BufRead,BufNewFile *.mocha,*.wingdis      set ft=java
  " Test file used for testing various vim settings
  au BufRead,BufNewFile test                   set ft=test
  au BufRead,BufNewFile *\.S                   set ft=asms
  au BufRead,BufNewFile *.bS                   set ft=myasm
  au BufRead,BufNewFile *access_log*,*.httplog set ft=httplog
  au BufRead,BufNewFile *.dtd                  set ft=dtd
  " Percy outline files
  au BufRead,BufNewFile *.otl                  set ft=tex
  au BufRead,BufNewFile *.wm                   set ft=webmacro
  au BufRead,BufNewFile *.wiki                 set ft=wiki
  au BufRead,BufNewFile *.twk                  set ft=twiki
  au BufRead,BufNewFile CONFIG,config          set ft=config
  au BufRead,BufNewFile *html                  set ft=html
  au BufRead,BufNewFile *.jsp                  set ft=jsp
  au BufRead,BufNewFile *.ptr                  set ft=bytecodetr
  au BufRead,BufNewFile *.mxm                  set ft=maxima
  au BufRead,BufNewFile *.conf                 set ft=nginx
  au BufRead,BufNewFile *.handlebars,*.hbs     set ft=html syntax=handlebars
  au BufRead,BufNewFile *.proto                set ft=proto
  au BufRead,BufNewFile rc,.rc                 set ft=sh
  au BufRead,BufNewFile *.dox                  set ft=doxygen
  au BufRead,BufNewFile GHI_ISSUE              set ft=gitcommit
augroup end

augroup something
  au!
  au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
augroup end

augroup tableave
   au!
   au TabLeave * let g:lasttab = tabpagenr()
augroup end

augroup syntax_highlighting
   au!
   au Filetype yaml call s:SetYamlOptions()
augroup end

function! s:SetYamlOptions()
   unlet! b:current_syntax
   runtime! syntax/yaml.vim

   unlet! b:current_syntax
   syntax include @YaML syntax/yaml.vim

   unlet! b:current_syntax
   syntax include @VTL syntax/velocity.vim
   syntax region vtlEmbedded matchgroup=Snip start='#{vtl' end='#vtl}' containedin=@YaML contains=@VTL

   hi link Snip SpecialComment
   let b:current_syntax = 'yaml.velocity'
endfunction
