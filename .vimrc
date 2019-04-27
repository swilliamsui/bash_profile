filetype plugin on

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

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.

" get my snippets
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "swilliams-snippets"]

" jshint config
let jshint2_save = 1

" syntastic "recommended settings" https://github.com/scrooloose/syntastic#3-recommended-settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" my syntastic overrides
"let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = []
let g:syntastic_html_tidy_ignore_errors = ['trimming empty <']

" Fix Python Path (for YCM)
let g:ycm_path_to_python_interpreter="/usr/bin/python"

