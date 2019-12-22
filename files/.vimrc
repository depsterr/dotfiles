" I honestly don't know
set nocompatible
filetype off

" Vundle plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-bufferline'
Plugin 'lervag/vimtex'
Plugin 'rust-lang/rust.vim'
call vundle#end()
filetype plugin indent on

" nerdtree settings
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" vimtex settings
let g:vimtex_view_general_viewer = 'mupdf'

" Set filetype of files
au BufReadPost,BufNewFile *.nasm,*.asm setlocal ft=nasm

" Enable syntax highlighting
syntax enable

" idk
set t_ut=

" set linenumbers
set number relativenumber

" enable statusbar
set laststatus=1

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

au BufReadPost,BufNewFile *.ms setlocal ft=groff

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

" Zen mode
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

" different colorscheme for tty
if $DISPLAY == ""
	colorscheme default
else
	colorscheme dcolor
endif

" tab settings
set ts=4 sw=4

" comments
au BufNewFile,BufRead * setlocal formatoptions-=cro
