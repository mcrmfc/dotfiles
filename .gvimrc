"remove toolbar
set guioptions-=T

"set graphical ViM Font (this is a Mac font!)
set gfn=Consolas\ Bold:h14

"requires ir_black theme in ~/.vim/colors
"colorscheme ir_black
colorscheme molokai 
set anti enc=utf-8 gfn=Source\ Code\ Pro:h16,Menlo:h14,Monaco:h14

"mac vim maximise 
":set fullscreen

"visual clue for line length
set colorcolumn=80

"start NERDTree on VIM open, and set starting directory
au VimEnter *  NERDTree /Users/matthewrobbins/workspace
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
