"Vundle Config
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"let Vundle manage Vundle
Bundle 'gmarik/vundle'
"bundles
Bundle "pangloss/vim-javascript"
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-cucumber'
Bundle 'majutsushi/tagbar'
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
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "mcrmfc/AutoTag"
Bundle "vim-scripts/Decho"
Bundle "honza/vim-snippets"
Bundle "ngmy/vim-rubocop"
Bundle 'rking/ag.vim'
Bundle 'scrooloose/syntastic'
Bundle 'elixir-lang/vim-elixir'
Bundle 'elzr/vim-json'
Bundle 'fatih/vim-go'
call vundle#end()

"tread md as markdown
au BufRead,BufNewFile *.md set filetype=markdown

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

" AutoTag
" Seems to have problems with some vim files
let g:autotagExcludeSuffixes="tml.xml.text.txt.vim"

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

"visual clue for line length
set colorcolumn=80


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

"easy expansion to directory of currently active buffer
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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
noremap fx <Esc>:call CloseAllButNerdTree()

" clear highlighted search results using leader c
map <leader>c :noh<cr>

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

function! CloseAllButNerdTree()
    let buffer = 'NERD_tree_1'

    let last_buffer = bufnr('$')

    let delete_count = 0
    let n = 1
    while n <= last_buffer
        if n != buffer && buflisted(n)
            if getbufvar(n, '&modified')
                echohl ErrorMsg
                echomsg 'No write since last change for buffer'
                            \ n '(add ! to override)'
                echohl None
            else
                silent exe 'bdel' . ' ' . n
                if ! buflisted(n)
                    let delete_count = delete_count+1
                endif
            endif
        endif
        let n = n+1
    endwhile

    if delete_count == 1
        echomsg delete_count "buffer deleted"
    elseif delete_count > 1
        echomsg delete_count "buffers deleted"
    endif

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
