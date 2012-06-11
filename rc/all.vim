" add to your own .vimrc:
"
"   source ~/.vim/rc/all.vim
"
set nocompatible
call pathogen#infect()
syntax on
filetype plugin indent on

" enable matchit
runtime macros/matchit.vim

source ~/.vim/rc/arrow_keys.vim
source ~/.vim/rc/splits.vim
source ~/.vim/rc/history.vim
source ~/.vim/rc/statusbar.vim
source ~/.vim/rc/ruby.vim
source ~/.vim/rc/clojure.vim
source ~/.vim/rc/bufexplorer.vim
source ~/.vim/rc/search.vim
source ~/.vim/rc/indent.vim
source ~/.vim/rc/visual.vim
source ~/.vim/rc/keys.vim
source ~/.vim/rc/complete.vim
source ~/.vim/rc/tabularize.vim
