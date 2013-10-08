set runtimepath+=$HOME/.vim
call pathogen#infect()

" NERDTree alias
map <F2> :NERDTreeToggle<CR>

" Lorem Ipsum text
command -nargs=* Lipsum Loremipsum <args>

" Go language support.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
set hidden

set background=dark
set autoread nobackup nowritebackup noswapfile
set guifont=Lucida_Console:h12:cANSI
set number ruler cc=80
set nowrap
colorscheme molokai
set encoding=utf-8
syntax on
set backspace=indent,eol,start
set showmatch hlsearch incsearch
set ignorecase smartcase
behave mswin

filetype plugin on
filetype indent on

set autoread

set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab smarttab

set autoindent copyindent

set mouse=a

" Smart Home-Button Behavior from http://vim.wikia.com/wiki/Smart_home
function! SmartHome()
	let first_nonblank = match(getline('.'), '\S') + 1
	if first_nonblank == 0
		return col('.') + 1 >= col('$') ? '0' : '^'
	endif

	if col('.') == first_nonblank
		return '0'  " if at first nonblank, go to start line
	endif
	return &wrap && wincol() > 1 ? 'g^' : '^'
endfunction
noremap <expr> <silent> <Home> SmartHome()
imap <silent> <Home> <C-O><Home>

" Conque shell
command Sh ConqueTerm sh

if has('win32')
	" SnipMate Windows support
	source ~/.vim/bundle/snipMate/after/plugin/snipMate.vim

	source $VIMRUNTIME/mswin.vim
endif
