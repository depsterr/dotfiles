"
" I honestly don't know
"

set nocp
set t_ut=


"
" Plugins
"

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

	" Syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'sirtaj/vim-openscad'

	" Appearance
Plugin 'bling/vim-bufferline'
Plugin 'junegunn/goyo.vim'

	" Functionallity
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-tmux-navigator'

	" Command integration
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

" netrw

let g:netrw_dirhistmax=0
let g:netrw_dirhistcnt=0
let g:netrw_localrmdir="rm -rf"


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

" quick exiting
noremap <C-c> :q<CR>
noremap <C-d> :q<CR>

" localleader 
let maplocalleader = "\<space>"

" goyo (zm stands for zenmode)
noremap <localleader>zm : Goyo<CR>

" indent lines
noremap <tab> >>
noremap <S-tab> <<


"
" Hex (I wish I knew how to make the variable buffer specific)
"

noremap <localleader>he :call HexToggle()<CR>

" defualt each buffer to not be hex
au BufReadPost,BufNewFile * let b:is_hex = 0

function! HexToggle()
	if b:is_hex
		let b:is_hex = 0
		:%!xxd -r
	else
		let b:is_hex = 1
		:%!xxd
	endif
endfunction	

" defualt each buffer to not be hex
au BufWritepre * call HexSafeWrite()

function! HexSafeWrite()
	if b:is_hex
		let b:is_hex = 0
		:%!xxd -r
	endif
endfunction


"
" Groff
"

" Groff Compile
noremap <localleader>gc :call GroffCompile(1)<CR>
" Groff Loud Compile
noremap <localleader>glc :call GroffCompile(0)<CR>
" Groff Compile To Preview
noremap <localleader>gp :call GroffPreview()<CR>
" Document Preview
noremap <localleader>dp :call DocPreview()<CR>

function! GroffCompile(issilent)
	if a:issilent
	: silent ! refer -p ~/.groff/bibl.ms "%" | groff -e -Kutf8 -U -ms -Tpdf > "%.pdf"
	else
	: ! refer -p ~/.groff/bibl.ms "%" | groff -Kutf8 -e -U -ms -Tpdf > "%.pdf"
	endif
	: redraw!
endfunction

function! GroffPreview()
	: silent ! refer -p ~/.groff/bibl.ms "%" | groff -e -Kutf8 -U -ms -Tpdf | zathura - &
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

" format options
au BufReadPost,BufNewFile * setlocal formatoptions-=cro

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
au BufReadPost,BufNewFile *.s,*.nasm,*.asm setlocal ft=nasm
