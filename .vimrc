"Enables filetype specific configs.
"add configs to .vim/after/ftplugin

filetype on
filetype plugin on
filetype indent on
set relativenumber
set colorcolumn=110
set textwidth=110
set spell spelllang=en_gb

call plug#begin('~/.vim/plugged')

"Syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"CPP plugins
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }


"Fortran plugins
Plug 'rudrab/vimf90', { 'for': 'f95' }

"TeX plugins
Plug 'lervag/vimtex', { 'for': 'tex' }
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_open_on_warning = 0
Plug 'townk/vim-autoclose', { 'for': 'tex' }

"Python plugins
Plug 'vim-scripts/indentpython.vim', { 'for': 'py' }
"see Arch install instruction for below to work
Plug 'vim-syntastic/syntastic', { 'for': 'py' } 
Plug 'nvie/vim-flake8', { 'for': 'py' } 

"Global plugins
Plug 'morhetz/gruvbox'
Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'

call plug#end()

"Ctrl-f to skip past parenthesis
inoremap <C-f> <right>

"Correct spelling mistakes with Ctrl-L
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"PEP 8 Python Options
let python_highlight_all=1
let g:syntastic_check_on_open = 1
syntax on
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set colorcolumn=79 |
    \ set fileformat=unix

" Fortran style option
let fortran_linter = -1
let g:fprettify_options = ''
au BufNewFile,BufRead *.f95
    \ set tabstop=3 |
    \ set softtabstop=3 |
    \ set shiftwidth=3 |
    \ set textwidth=132 |
    \ set expandtab |
    \ set autoindent |
    \ set colorcolumn=132 |
    \ set fileformat=unix
let g:coc_start_at_startup = 0

"Automatic vertical centering
augroup KeepCentered
  autocmd!
  autocmd CursorMoved * normal! zz
augroup END

autocmd vimenter * ++nested colorscheme gruvbox
