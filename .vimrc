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

"CPP plugins
Plug 'dense-analysis/ale', { 'for': 'cpp' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

"TeX plugins
Plug 'lervag/vimtex', { 'for': 'tex' }
	let g:tex_flavor='latex'
	let g:vimtex_view_method='zathura'
	let g:vimtex_quickfix_open_on_warning = 0
Plug 'townk/vim-autoclose', { 'for': 'tex' }

"Python plugins
Plug 'vim-scripts/indentpython.vim', { 'for': 'py' }
"see Arch install instruction for below to work
Plug 'Valloric/YouCompleteMe', { 'for': 'py' } 
Plug 'vim-syntastic/syntastic', { 'for': 'py' } 
Plug 'nvie/vim-flake8', { 'for': 'py' } 

"Global plugins
Plug 'morhetz/gruvbox'
Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
Plug 'ervandew/supertab'

call plug#end()

" Use Supertab for YCM/UltiSnips Compatibility
" https://stackoverflow.com/questions/14896327/ultisnips-and-youcompleteme
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Shift-tab to skip past last character of line
inoremap <S-tab> <C-o>$

"Correct spelling mistakes with Ctrl-L
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"PEP 8 Python Options
let python_highlight_all=1
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

"Automatic vertical centering
augroup KeepCentered
  autocmd!
  autocmd CursorMoved * normal! zz
augroup END

autocmd vimenter * ++nested colorscheme gruvbox
