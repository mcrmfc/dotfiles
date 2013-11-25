"don't behave like vi!
set nocompatible

"Vundler Config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"let Vundle manage Vundle
Bundle 'gmarik/vundle'
"bundles
Bundle "pangloss/vim-javascript"
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-cucumber'
Bundle 'majutsushi/tagbar'
Bundle 'airblade/vim-gitgutter'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'othree/html5.vim'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'freitass/todo.txt-vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rodjek/vim-puppet'


"add line numbers
set nu

"remap leader to comma
let mapleader=","
let g:mapleader=","

let g:airline_powerline_fonts = 1

"256 colors
set t_Co=256

"tell default html.vim to indent ALL the elements
"https://github.com/vim-scripts/indenthtml.vim
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
let g:html_indent_inctags = "html,body,head,tbody"

"utf-8 encoding
"set enc=utf-8

"standard maximise hack
"set lines=999
"set columns=999

"always show the status bar
set laststatus=2

"set unix line endings
set fileformats=unix

"indent using spaces (4)
set autoindent
"set smartindent "don't think this should be used if using plugin indent
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4

"indent based on file type, if recognised
"matt - i think this means a file will get reformatted on openening in a
"buffer - maybe not best idea!
"if has("autocmd")
"filetype indent on
"endif
"
"highlight matching brackets
set showmatch
"disable beeps and screen flashing
set vb t_vb=
"sensible line numbering
set ruler
"tells vim to manage buffers efficiently
set hidden
"get more command history
set history=1000
"should be set as standard, but just incase...allows % to jumb between brackets, if/else etc...
runtime macros/matchit.vim
" informs auto-suggest to show all possible matches of commands
set wildmenu
set wildmode=list:longest " turn on wild mode huge list
"intuitive backspacing in insert mode
set backspace=indent,eol,start

"File-type highlighting and configuration.
"Run :filetype (without args) to see what you may have
"to turn on yourself, or just set them all to be sure.
syntax on
filetype off
filetype plugin on
"Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

"Tags - search up to find tags file
set tags=./tags;
"TagList - Ctags integration
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
"TagBar shortcut
nmap <F8> :TagbarToggle<CR>

"Trailing space highlight
"highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$/
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Pressing ,p will toggle and untoggle ctrlp
map <leader>p :CtrlP<cr>

""Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"garuntees that the NERDTrees for all tabs will be one and the same
map <F2> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

set nohidden

"remap bnext to make it easier to cycle through buffers, also show list of available buffers after!
:nnoremap <C-Tab> :bnext<CR>:redraw<CR>:ls<CR>
"shortcut for navigating to numbered buffer
:nnoremap <F1> :buffers<CR>:buffer<Space>

"remap to allow easy hex editing
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

"function to cleanly close buffers when you have NERDTree open, i.e. closes
"buffer without removing NERDTree
noremap fc <Esc>:call CleanClose(1)
noremap fq <Esc>:call CleanClose(0)

function! CleanClose(tosave)
    if (a:tosave == 1)
        w!
    endif
    let todelbufNr = bufnr("%")
    let newbufNr = bufnr("#")
    if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
        exe "b".newbufNr
    else
        bnext
    endif

    if (bufnr("%") == todelbufNr)
        new
    endif
    exe "bd".todelbufNr
    "call Buftabs_show()
endfunction

function! RemoveDosLE()
   :%s/\r//g
endfunction
nnoremap<Leader>le <Esc>:call RemoveDosLE()

function! TidyXml()
    set ft=xml
    :%s/></>\r</g
    :norm gg=G
endfunction

noremap tx <Esc>:call TidyXml()
