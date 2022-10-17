" Use system clipboard
set clipboard=unnamed

"Enables filetype specific configs.
"add configs to .vim/after/ftplugin
filetype off
filetype plugin on
filetype indent on

set relativenumber "Hybrid line numbering
set backspace=indent,eol,start "Fix backspace

" Text length limit
set colorcolumn=80 
set textwidth=80
set formatoptions+=t "Hard wrap at 80 chars

set mouse=a "Use mouse
set clipboard=unnamed "Use system clipboard

"Spelling
setlocal spell
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
	let g:vimtex_view_method='skim'
	let g:vimtex_quickfix_open_on_warning = 0
	let g:vimtex_view_skim_sync = 1 
	let g:vimtex_view_skim_activate = 1 
	let g:vimtex_compiler_engine = 'lualatex'

Plug 'townk/vim-autoclose', { 'for': 'tex' }

"Python plugins
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
"see Arch install instruction for below to work
Plug 'vim-syntastic/syntastic', { 'for': 'python' } 
Plug 'nvie/vim-flake8', { 'for': 'python' } 
Plug 'erietz/vim-terminator', { 'for': 'python', 'branch': 'main' }

"R plugins
set encoding=utf-8
Plug 'jalvesaq/Nvim-R', { 'for': 'R' }
Plug 'roxma/nvim-yarp', { 'for': 'R' }
Plug 'ncm2/ncm2', { 'for': 'R' }
Plug 'gaalcaras/ncm-R', { 'for': 'R' }

"Global plugins
Plug 'morhetz/gruvbox'
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'

call plug#end()

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
command Run :w<CR>:!python3 %<CR>

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

" Spelling highlights
autocmd colorscheme * hi clear SpellBad
autocmd colorscheme * hi SpellBad cterm=underline

autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark

" Spelling highlights
hi clear SpellBad 
hi SpellBad cterm=underline ctermfg=NONE ctermbg=NONE 
