"
" I honestly don't know
"

set nocompatible
filetype off
set t_ut=


"
" Vundle plugins
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
call vundle#end()
filetype plugin indent on

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }


"
" General setup
"

" Enable syntax highlighting
syntax enable

" set linenumbers
set nu rnu

" enable statusbar
set laststatus=1

" tab settings
set ts=4 sw=4

" colorscheme
colorscheme dcolor


"
" Non-specific remaps
"

" remove arrow keys (added this when I was new to get used to hjkl
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Map control+hjkl to switch split
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" leader key
let maplocalleader = "\<space>"


"
" Hex editing
"
noremap <localleader>he :call HexToggle()<CR>

let is_hex = 0

function! HexToggle()
	if l:is_hex
		let l:is_hex = 0
		:%!xxd -r
	else
		let l:is_hex = 1
		:%!xxd
	endif
endfunction	


"
" groff
"
noremap <localleader>grc :call GroffCompile(1)<CR>
noremap <localleader>grlc :call GroffCompile(0)<CR>
noremap <localleader>grp :call GroffPreview()<CR>

" requires my groffc script
function! GroffCompile(issilent)
	if a:issilent
	: silent ! groffc "%" "/tmp/%"
	else
	: ! groffc "%" "/tmp/%"
	endif
	: redraw!
endfunction

function! GroffPreview()
	: silent ! zathura "/tmp/%" &
endfunction


"
" folding
"
set foldmethod=indent
set foldlevelstart=99
noremap <localleader>fo za
noremap <localleader>fr zA


"
" zen mode
"

noremap <localleader>zm :call ZenToggle()<CR>

let is_zen = 0

function! ZenToggle()
	if g:is_zen
		let g:is_zen = 0
		set nu rnu
		set laststatus=1
		set showmode
		set ruler
		set showcmd
	else
		let g:is_zen = 1
		set nonu nornu
		set laststatus=0
		set noshowmode
		set noruler
		set noshowcmd
	endif
endfunction	

if g:is_zen
	set nonu nornu
	set laststatus=0
	set noshowmode
	set noruler
	set noshowcmd
endif


"
" autocommands
"

" comments
au BufNewFile,BufRead * setlocal formatoptions-=cro

" set filetype of groff files
au BufReadPost,BufNewFile *.ms setlocal ft=groff

" set filetype of asm files
au BufReadPost,BufNewFile *.nasm,*.asm setlocal ft=nasm
