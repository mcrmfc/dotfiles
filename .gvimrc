"remove toolbar
set guioptions-=T

"requires theme in ~/.vim/colors
"colorscheme ir_black
colorscheme molokai 

set anti enc=utf-8
"set graphical ViM Font (this is a Powerline Patched font!)
set guifont=Source\ Code\ Pro\ for\ Powerline:h13

"mac vim maximise 
":set fullscreen

"visual clue for line length
set colorcolumn=80

"start NERDTree on VIM open, and set starting directory
au VimEnter *  NERDTree /Users/ost/workspace
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
