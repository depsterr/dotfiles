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
Plugin 'sirtaj/vim-openscad'
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

" linebreak
set lbr


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

" goyo (zm stands for zenmode)
noremap <localleader>zm : Goyo<CR>


"
" Hex (I wish I knew how to make the variable buffer specific)
"

noremap <localleader>he :call HexToggle()<CR>

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

" Groff Compile
noremap <localleader>gc :call GroffCompile(1)<CR>
" Groff Loud Compile
noremap <localleader>glc :call GroffCompile(0)<CR>
" Document Preview
noremap <localleader>dp :call DocPreview()<CR>

function! GroffCompile(issilent)
	if a:issilent
	: silent ! refer -p ~/.groff/bibl.ms "%" | groff -e -U -ms -Tpdf > "%.pdf"
	else
	: ! refer -p ~/.groff/bibl.ms "%" | groff -e -U -ms -Tpdf > "%.pdf"
	endif
	: redraw!
endfunction

function! DocPreview()
	: silent ! zathura "%.pdf" &
endfunction

"
" Markdown
"

" Markdown Compile
noremap <localleader>mc :call MdCompile(1)<CR>
" Markdown Loud Compile
noremap <localleader>mlc :call MdCompile(1)<CR>
" Document Preview
" noremap <localleader>dp :call DocPreview()<CR> 

" Slides
" Markdown Slides Compile
noremap <localleader>msc :call MdsCompile(1)<CR>
" Markdown Slides Loud Compile
noremap <localleader>mslc :call MdsCompile(1)<CR>
" Markdown Slides Preview
noremap <localleader>msp :call SlidesPreview()<CR> 

function! MdCompile(issilent)
	if a:issilent
	: silent ! pandoc % -o "%.pdf"
	else
	: ! pandoc % -o "%.pdf"
	endif
	: redraw!
endfunction

function! MdsCompile(issilent)
	if a:issilent
	: silent ! pandoc -t slidy -s % -o "%.html"
	else
	: ! pandoc -t slidy -s % -o "%.html"
	endif
	: redraw!
endfunction

function! SlidesPreview()
	: silent ! surf "%.html" &
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
noremap <localleader>ss :set spelllang=sv spell<CR>
" English
noremap <localleader>se :set spelllang=en spell<CR>
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

" set goyo mode for text
au BufReadPost,BufNewFile *.ms,*.md,*.tex Goyo

" navigating multi lines with j and k
au BufReadPost,BufNewFile *.ms,*.md,*.tex noremap j gj
au BufReadPost,BufNewFile *.ms,*.md,*.tex noremap k gk

" set linebreak for c files
au BufReadPost,BufNewFile *.c setlocal textwidth=80

" set filetype of asm files
au BufReadPost,BufNewFile *.nasm,*.asm setlocal ft=nasm
