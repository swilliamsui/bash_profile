" By default use 4 as the tab width
set tabstop=4
set softtabstop=4
set shiftwidth=4
function! s:onopen()
	" If the file already has literal tabs, then don't expand tabs,
	if search( "\t" , "cnw" )
		set noexpandtab
	else
		set expandtab
	endif
endfunction

autocmd BufNewFile,BufReadPost,StdinReadPost * nested call s:onopen()

autocmd BufWritePre * :%s/\s\+$//e

