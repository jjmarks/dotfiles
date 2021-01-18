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

"Global plugins
Plug 'morhetz/gruvbox'
Plug 'sirver/ultisnips'
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'

call plug#end()

"Shift-tab to skip past last character of line
inoremap <S-tab> <C-o>$

autocmd vimenter * ++nested colorscheme gruvbox

"Automatic vertical centering
augroup KeepCentered
  autocmd!
  autocmd CursorMoved * normal! zz
augroup END
