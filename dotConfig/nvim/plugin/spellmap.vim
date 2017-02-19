" File    = ~/spellmap.vim

function Switch_Language()
	" was this called before?
	if (!exists("b:spell_lang"))
		let b:spell_lang = 0
	endif
	if (b:spell_lang == 0)
                setlocal spell spelllang=en_us
		let b:spell_lang = 1
		echom "english spelling"
	elseif (b:spell_lang == 1)
                setlocal spell spelllang=de_ch
		let b:spell_lang = 2
		echom "german (ch) spelling"
	else
                setlocal nospell
		let b:spell_lang = 0
		echom "spelling turned off"
	endif
endfunction


map <esc>[32~ :let r=Switch_Language()<CR>


