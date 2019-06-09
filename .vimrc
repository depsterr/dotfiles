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
colorscheme monokai
set t_ut=
set nu
set laststatus=2
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
