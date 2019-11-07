set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on
let NERDTreeShowHidden=1

syntax enable
set t_ut=
set nu
set laststatus=2
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

map <C-n> :NERDTreeToggle<CR>
hi Normal guibg=NONE ctermbg=NONE

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  " Uncomment to have 'bomb' on by default for new files.
  " Note, this will not apply to the first, empty buffer created at Vim startup.
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

if $DISPLAY == ""  "check if in tty
	colorscheme default
	let g:airline_theme='base16_default'
else
	colorscheme github
	let g:airline_theme='atomic'
endif

set ts=4 sw=4

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
