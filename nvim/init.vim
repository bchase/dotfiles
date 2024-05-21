set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" set paste

set clipboard+=unnamedplus

lua require('bchase')
