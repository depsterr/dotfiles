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
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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

" vimtex settings
let g:vimtex_view_general_viewer = 'mupdf'

" Set filetype of .nasm and .asm files
au BufReadPost,BufNewFile *.nasm,*.asm setlocal ft=nasm

" Enable syntax highlighting
syntax enable
" idk
set t_ut=
" set linenumbers
set number relativenumber
" enable airline
set laststatus=2
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

"
" Hex editing
"
noremap <localleader>he :call HexToggle()<CR>

let g:is_hex = 0

function! HexToggle()
	if g:is_hex
		let g:is_hex = 0
		:%!xxd -r
	else
		let g:is_hex = 1
		:%!xxd
	endif
endfunction	

" Line numbers
noremap <localleader>hl :set nu! rnu!<CR>

"
" Markdown preview
"

noremap <localleader>md :call StartMdPreview()<CR>

function! StartMdPreview()
	:! pgrep grip | xargs kill -KILL
	:! grip %  &
	:! surf http://localhost:6419 &
endfunction	

" folding
set foldmethod=indent
set foldlevelstart=99

noremap <space> za
noremap <C-@> zA

" different colorscheme for tty
if $DISPLAY == ""
	colorscheme default
	let g:airline_theme='base16_default'
else
	colorscheme dcolor
	let g:airline_theme='atomic'
endif

" tab settings
set ts=4 sw=4

" comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
