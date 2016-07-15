set nocompatible

call pathogen#infect()

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'slashmili/alchemist.vim'
call vundle#end()

syntax on
" set t_Co=256
" color dracula
filetype plugin indent on

set tabstop=2
set shiftwidth=2

set expandtab
set smarttab

set autoindent
set smartindent

set incsearch

set hidden

set showcmd
set showmode

set wildmenu
set wildmode=list:longest,full

" set foldmethod=indent
set foldmethod=syntax
set foldlevelstart=20

"ignore case when all lower
set ic
set scs

"move to front/end of line
nnoremap <C-h> ^
nnoremap <C-l> $
vnoremap <C-h> ^
vnoremap <C-l> $

"add line below/above cursor
nnoremap <ENTER> o<ESC>k
nnoremap <Bslash><Bslash> O<ESC>j

"map space to insert space
"map <S-SPACE> i <ESC>
nnoremap <SPACE> i <ESC>

"map jj to return to normal mode
inoremap jj <ESC>
";; for the same, but one char left
" inoremap ;; <ESC>la
inoremap kk <ESC>la

"switch ; and : mappings
nnoremap ; :
nnoremap : ;

autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2

"text folding in coffeescript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable


"todo ruby into string #{}
"todo comment current line and copy below
"todo switch assignment around =


"testing this one out
"trying to speed up large files
let loaded_matchparen = 1


"hamlc syntax highlighting
au BufRead,BufNewFile *.hamlc set ft=haml

"thor syntax highlighting
au BufRead,BufNewFile *.thor set ft=ruby


" set markdown syntax highlighting for .md files
au BufRead,BufNewFile *.md set ft=markdown
" consider Jekyll YAML to be a comment
au BufNewFile,BufRead,BufWrite *.md syntax match Comment /\%^---\_.\{-}---$/
" syntax highlighting for <pre><code> in markdown
let g:markdown_fenced_languages = ['ruby', 'elixir', 'sh', 'yaml', 'javascript', 'html', 'coffee']


"text folding in coffeescript
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable

" c-s to save file
nnoremap <C-S> :w<CR>
"" nnoremap <C-s> :w<CR>
"" nmap <C-s> :w<CR>
"" imap <C-s> <Esc>:w<CR>a
"" imap <C-s> <Esc><c-s>

"indent (foldable) block
nnoremap <C-=> za==zR

command Prylast read ! tail -1 ~/.pry_history
command Prylastfive read ! tail -5 ~/.pry_history
command Shelllast read ! tail -2 ~/.zsh_history | head -1 | cut -c 16-
command Shelllastfive read ! tail -6 ~/.zsh_history | head -5 | cut -c 16-

" delete trailing \s on :w
autocmd BufWritePre * :%s/\s\+$//e
" autocmd Filetype ruby match Error /\s\+$/
" " all files:
" " match Error /\s\+$/

set runtimepath^=~/.vim/bundle/ctrlp.vim

" hi Search cterm=NONE ctermfg=grey ctermbg=DarkCyan
" set hlsearch

let g:ctrlp_custom_ignore = '_build\|deps\|node_modules\|DS_Store\|/.git'


" elixir
function MixProjectName()
  return system('(head -1 mix.exs 2>/dev/null || echo " Module.") | pcregrep -o1 " (\w+)\."')
endfunction

function AliasPhoenixModelsLike(model_name)
  return system('cat web/models/* | pcregrep -o1 "defmodule ([\w.]+)" | grep -i ' . a:model_name . ' | sed "s/^/alias /"')
endfunction

function GetPhoenixControllerName()
  let g:phoenix_cname=input('Controller/Model Name: ')
  return g:phoenix_cname
endfunction


let g:netrw_browsex_viewer = 'google-chrome'

" http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
" let mapleader=','
" if exists(":Tabularize")
"   nmap <Leader>a= :Tabularize /=<CR>
"   vmap <Leader>a= :Tabularize /=<CR>
"   nmap <Leader>a: :Tabularize /:\zs<CR>
"   vmap <Leader>a: :Tabularize /:\zs<CR>
" endif
