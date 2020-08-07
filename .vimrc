"Enables filetype specific configs.
"add configs to .vim/after/ftplugin

filetype on
filetype plugin on
filetype indent on
set relativenumber

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
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

call plug#end()

autocmd vimenter * colorscheme gruvbox
