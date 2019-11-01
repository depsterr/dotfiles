set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()
filetype plugin indent on
let NERDTreeShowHidden=1

syntax enable
colorscheme github
set t_ut=
set nu
set laststatus=2
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
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

let g:AutoPairsShortcutFastWrap = "<C-f>"
set ts=4 sw=4
