hi NonText         cterm=NONE ctermfg=0 
hi SpecialKey      cterm=NONE ctermfg=0 
hi StatusLine      cterm=NONE           ctermbg=6
hi VertSplit       cterm=NONE ctermfg=4 ctermbg=4
hi FillColumn      cterm=NONE           ctermbg=4 ctermfg=4
hi StatusLineNC    cterm=NONE           ctermbg=4
hi Cursor          cterm=bold ctermfg=7 
hi ModeMsg         cterm=bold ctermfg=6
hi Visual          cterm=NONE           ctermbg=0
hi LineNr          cterm=NONE ctermfg=4
hi Search          cterm=NONE ctermfg=0 ctermbg=3
hi IncSearch       cterm=NONE ctermfg=1 ctermbg=3

hi DiffAdd      cterm=NONE ctermbg=7
hi DiffChange   cterm=NONE ctermbg=7
hi DiffText     cterm=bold ctermbg=7
hi DiffDelete   cterm=NONE ctermbg=7

  " colors for color terminal (xterm) normal / bold


  " 0 : gray 
  hi Constant                       term=NONE      cterm=NONE		ctermfg=0 
  " 0b: dirty white
  hi htmlBold                       term=underline cterm=bold           ctermfg=0 gui=bold      guifg=grey80
  hi htmlBoldUnderline         term=bold,underline cterm=underline,bold ctermfg=0 gui=bold      guifg=grey80

  " 1 : red
  hi Statement start=t_md stop=t_me term=NONE      cterm=NONE           ctermfg=1 gui=NONE      guifg=#B00000
  " 1b: orange
  hi Exception start=t_md stop=t_me term=NONE      cterm=bold           ctermfg=1 gui=NONE      guifg=#FF3030

  " 2 : green
  hi Identifier                     term=underline cterm=NONE           ctermfg=2 gui=NONE      guifg=green4
  hi Type                           term=NONE      cterm=NONE           ctermfg=2 gui=NONE      guifg=green4

  " 2b: light green
  hi Special                        term=bold      cterm=bold           ctermfg=2 gui=NONE      guifg=#70FF70

  " 3 : yellow
  hi htmlItalic 	            term=underline cterm=NONE           ctermfg=3 gui=NONE      guifg=yellow3
  hi htmlUnderlineItalic 	    term=underline cterm=underline      ctermfg=3 gui=underline guifg=yellow3

  " 3b: light yellow
  hi String                         term=italic    cterm=bold           ctermfg=3 gui=NONE      guifg=#F0F080
  hi htmlBoldItalic 	            term=underline,bold cterm=bold           ctermfg=3 gui=bold      guifg=#F0F080
  hi htmlBoldUnderlineItalic        term=underline,bold cterm=underline,bold ctermfg=3 gui=bold,underline guifg=#F0F080

  " 4 : blue
  hi Comment                        term=bold      cterm=NONE           ctermfg=4 gui=NONE      guifg=blue3
  hi htmlLink			    term=underline cterm=underline      ctermfg=4 gui=underline guifg=blue3

  " 4b: light blue
  hi SpecialComment                 term=NONE      cterm=bold           ctermfg=4 gui=NONE      guifg=#B0B0FF
  hi javaUserLabel                  term=NONE      cterm=bold           ctermfg=4 gui=NONE      guifg=#B0B0FF

  " 5 : magenta
  hi StorageClass                   term=underline cterm=NONE           ctermfg=5 gui=NONE      guifg=#A000A0
  hi Structure                      term=underline cterm=NONE           ctermfg=5 gui=NONE      guifg=#A000A0
  hi Typedef                        term=underline cterm=bold           ctermfg=5 gui=NONE      guifg=#EFA0BF

  " 5b: light magenta
  hi Boolean                        term=italic    cterm=bold           ctermfg=6 gui=NONE      guifg=#F0F080

  " 6 : cyan
  " hi htmlItalic	                    term=italic    cterm=NONE           ctermfg=6 gui=italic    guifg=#009999
  hi Number	                    term=italic    cterm=NONE           ctermfg=6 gui=italic    guifg=#009999

  " 6b: light cyan
  hi Title			    term=bold      cterm=bold,underline ctermfg=6 gui=bold,underline guifg=#A0FFFF
  hi htmlH2			    term=bold      cterm=bold           ctermfg=6 gui=bold      guifg=#A0FFFF

  " 7 : light brown
  hi PreCondit                      term=underline cterm=NONE           ctermfg=7 gui=NONE      guifg=#D0B099
  hi PreProc                        term=underline cterm=NONE           ctermfg=7 gui=NONE      guifg=#D0B099

  " 7b: white
  hi Function  start=t_md stop=t_me term=NONE      cterm=bold           ctermfg=8 gui=NONE      guifg=white

  " normal: black
  " bold  : bluegreen

  hi Todo                           term=standout  cterm=bold ctermbg=4 ctermfg=7 gui=NONE guifg=white   guibg=blue3
  hi Error                          term=reverse   cterm=bold ctermbg=1           gui=NONE guibg=#B00000
  hi Debug                          term=NONE      cterm=NONE ctermbg=7 ctermfg=1 gui=NONE guifg=#B00000 guibg=#D0B099
  hi DebugString                    term=italic    cterm=NONE ctermbg=7 ctermfg=2 gui=NONE guifg=green4  guibg=#D0B099
  hi DebugType                      term=underline cterm=NONE ctermbg=7 ctermfg=5 gui=NONE guifg=#A000A0 guibg=#D0B099 gui=NONE
  hi DebugSpecial                   term=bold      cterm=bold ctermbg=7 ctermfg=2 gui=NONE guifg=#70FF70 guibg=#D0B099 gui=NONE
  hi htmlUnderline		    term=underline cterm=underline                gui=underline

  hi Normal                                                                                guifg=#000000 guibg=#AD926E

  hi DiffAdd                        term=underline cterm=NONE ctermbg=7

  if has("gui_running") 
      hi Error	 	gui=NONE guibg=red3
      hi Statement	gui=NONE guifg=red3
      hi Exception	gui=NONE guifg=red
      hi PreCondit	gui=NONE guifg=antiquewhite
      hi PreProc	gui=NONE guifg=antiquewhite
      hi StorageClass	gui=NONE guifg=magenta3
      hi Structure	gui=NONE guifg=magenta3
      hi Typedef	gui=NONE guifg=#FFD0FF
      hi String	   	gui=NONE guifg=#FFFFA0
      hi Comment	gui=NONE guifg=blue3
      hi htmlLink       gui=underline guifg=blue3
      hi Special	gui=NONE guifg=green1
      hi Todo	    	gui=NONE guifg=white 	guibg=blue3
      hi Identifier	gui=NONE guifg=green4
      hi Function	gui=NONE guifg=white
      hi htmlBold       gui=bold guifg=white
      hi Type        	gui=NONE guifg=green4
      hi SpecialComment gui=NONE guifg=lightblue1
      hi Debug        	gui=NONE guifg=red3 	guibg=antiquewhite
      hi DebugString 	gui=NONE guifg=green4 	guibg=antiquewhite
      hi DebugType	gui=NONE guifg=magenta3 guibg=antiquewhite
      hi DebugSpecial	gui=NONE guifg=green1 	guibg=antiquewhite
  endif

  hi link CommentTitle SpecialComment
  " hi link Number 	NONE
  hi link Character	String
  hi link DebugBoolean  Debug
  hi link Boolean  Typedef
