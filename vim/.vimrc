" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
 set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
" filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':

nmap <F3> i<C-R>=strftime("%b %d, %Y")<CR><Esc>
imap <F3> <C-R>=strftime("%b %d, %Y")<CR>
set spell spelllang=en_us
call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'rust-lang/rust.vim'
call plug#end()

set backspace=indent,eol,start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:airline_powerline_fonts = 1
let g:syntastic_rust_checkers = ['rustc']

let g:vimtex_compiler_latexmk = {
			\ 'options' : [
			\ '-pdf',
			\ '-bibtex',
			\ '-verbose',
			\ '-file-line-error',
			\ '-synctex=1',
			\ '-interaction=nonstopmode',
			\ '-shell-escape'
			\ ]
			\ }
