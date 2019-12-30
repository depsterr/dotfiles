"
" I honestly don't know
"

set nocompatible
filetype off
set t_ut=


"
" Plugins
"

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bling/vim-bufferline'
Plugin 'junegunn/goyo.vim'
call vundle#end()
filetype plugin indent on

" Syntastic 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }


"
" General setup
"

" syntax highlighting
syntax enable

" linenumbers
set nu rnu

" statusbar
set laststatus=1

" tab size
set ts=4 sw=4

" colorscheme
colorscheme dcolor

" tabcomplete
set wildmode=longest,list,full
set wildmenu

" splits
set splitbelow splitright


"
" Remaps
"

" splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-c> <C-w>c

" localleader 
let maplocalleader = "\<space>"

" open current dir
noremap <localleader>fd : vsplit .<CR>

" goyo
noremap <localleader>zm : Goyo<CR>

" hex
noremap <localleader>he :call HexToggle()<CR>

" groff
noremap <localleader>gc :call GroffCompile(1)<CR>
noremap <localleader>glc :call GroffCompile(0)<CR>
noremap <localleader>gp :call GroffPreview()<CR>

"
" Hex (I wish I knew how to make the variable buffer specific)
"


let is_hex = 0

function! HexToggle()
	if g:is_hex
		let g:is_hex = 0
		:%!xxd -r
	else
		let g:is_hex = 1
		:%!xxd
	endif
endfunction	


"
" Groff
"

function! GroffCompile(issilent)
	if a:issilent
	: silent ! refer -p ~/.groff/bibl.ms "%" | groff -e -U -ms -Tpdf > "%.pdf"
	else
	: ! refer -p ~/.groff/bibl.ms "%" | groff -e -U -ms -Tpdf > "%.pdf"
	endif
	: redraw!
endfunction

function! GroffPreview()
	: silent ! zathura "%.pdf" &
endfunction


"
" Folding
"
set foldmethod=indent
set foldlevelstart=99
noremap <localleader>fo za
noremap <localleader>fr zA

"
" Spellchecking
"

" Swedish
noremap <localleader>ss :set spelllang=sv<CR> :setlocal spell<CR>
" English
noremap <localleader>se :set spelllang=en<CR> :setlocal spell<CR>
" off
noremap <localleader>so :setlocal nospell<CR>
" programmer
noremap <localleader>sp :SyntasticCheck<CR>

" next highlighted word
noremap <localleader>sn ]s
" previous highlighted word
noremap <localleader>sN [s

" change word
noremap <localleader>sc z=

" add word to dictionary
noremap <localleader>sa zg
" remove word from dictionary
noremap <localleader>sr zug
" ban word from dictionary
noremap <localleader>sb zw
" unban word from dictionary
noremap <localleader>su zuw


"
" Autocommands
"

" comments
au BufNewFile,BufRead * setlocal formatoptions-=cro

" set filetype of groff files
au BufReadPost,BufNewFile *.ms setlocal ft=groff

" set filetype of asm files
au BufReadPost,BufNewFile *.nasm,*.asm setlocal ft=nasm

" resize automatically
autocmd VimResized * <C-w>=
