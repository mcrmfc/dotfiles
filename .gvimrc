"remove toolbar
set guioptions-=T
"remove menubar
set guioptions-=m

"requires theme in ~/.vim/colors
"colorscheme ir_black
let g:airline_symbols.space = "\ua0"
colorscheme molokai

set anti enc=utf-8
"set graphical ViM Font (this is a Powerline Patched font!)
set guifont=Sauce\ Code\ Powerline\ Regular\ 10

"mac vim maximise
"set fullscreen
"nix vim maximise
set lines=999 columns=999

"start NERDTree on VIM open, and set starting directory
au VimEnter *  NERDTree /home/matt/workspace
au BufEnter * NERDTreeMirror
"garuntees that the NERDTrees for all tabs will be one and the same
map <F2> :NERDTreeToggle \| :silent NERDTreeMirror<CR>

"easy window switching
"nmap <Tab> <C-w>w
"persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

"make copy paste sane
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
