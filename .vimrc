" ================== basic ==================
syntax on
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

set cin nu tabstop=4 shiftwidth=4  autoread cc=80
set expandtab smarttab smartcase ignorecase showmatch
set fdm=syntax foldlevel=99 cmdheight=1 scrolloff=7
set backspace=indent,eol,start
set hlsearch incsearch splitright laststatus=2
set cursorcolumn cursorline
highlight CursorLine cterm=NONE ctermbg=492 ctermfg=NONE
highlight CursorColumn cterm=NONE ctermbg=492 ctermfg=NONE

autocmd Filetype html,tex setlocal sw=2 ts=2
autocmd Filetype python setlocal fdm=indent

autocmd Filetype go setlocal noexpandtab

" switch in buffer with C-j and C-k
set hidden
nnoremap <C-j> :bp<CR>
nnoremap <C-k> :bn<CR>
nnoremap <C-y> :bp\|:bd#<CR> " close buffer without closing window

" encoding ------------------------
set fileencoding=utf8 " new file
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set encoding=utf8 " vi内部使用
set termencoding=utf8 "和终端crt编码一致


autocmd Filetype make set nosmarttab
" remove trailing space--------------
" autocmd BufWritePre *.[php|coffee|less|rb|py|html|go] :%s/\s\+$//e
autocmd BufWritePre * :%s/\s\+$//e
" autocmd BufWritePre *.go :%s/\s\+$//e
" autocmd BufWritePre *.cc :%s/\s\+$//e
" autocmd BufWritePre *.cpp :%s/\s\+$//e
" autocmd BufWritePre *.hpp :%s/\s\+$//e
" autocmd BufWritePre *.c :%s/\s\+$//e
" autocmd BufWritePre *.h :%s/\s\+$//e

" go to last edit line
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ================== basic ==================

" ================== plugin by Plugin ==================
" Plugin plugin
"set runtimepath+=~/.vim/bundle/neobundle.vim
set nocompatible
filetype off
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'valloric/youcompleteme'
    Plugin 'bling/vim-airline'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-fugitive'
    "Plugin 'scrooloose/syntastic'
    Plugin 'tpope/vim-surround'
    Plugin 'kien/ctrlp.vim'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'majutsushi/tagbar'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'rking/ag.vim'
    Plugin 'mattesgroeger/vim-bookmarks'
    Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

" ---------------- youcompleteme ----------------
set completeopt+=longest,menu
set completeopt-=preview
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
" map <C-]> :YouCompleter GoTo<CR>
map gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>jd :YouCompleter GoTo<CR>

" ---------------- NERDTree ----------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ---------------- airline conifg ----------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" ---------------- ctrl-p ----------------
let g:ctrlp_working_path_mode = 'cra'

" ================== plugin by Plugin ==================
"
" Custom settings
"
