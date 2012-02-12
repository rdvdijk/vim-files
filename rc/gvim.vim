" add to your own .gvimrc:
"
"   source ~/.vim/rc/gvim.vim
"
source ~/.vim/rc/all.vim
source ~/.vim/rc/tabularize.vim

colorscheme ir_black

" Antialias
set antialias

" Turn on only autoselect, console dialogs and tab pages
" No menubar, toolbar or scrollbars, as minimal as possible
set guioptions=Ace

" Get Dejavu Sans mono here: http://dejavu-fonts.org/
set guifont=Dejavu\ Sans\ Mono:h13

" Turn off beep
set vb t_vb=

if has("gui_macvim")
  " fullscreen options (MacVim only), resized window when changed to fullscreen
  "
  " If you are on OSX Lion, and you hate Lion's native full screen, turn it off for macvim:
  "
  "   defaults write org.vim.MacVim MMNativeFullScreen 0
  "
  " Press Ctrl+Cmd+F to go full screen.
  set fuoptions=maxvert,maxhorz

  " Available when using experimental renderer in macvim
  " set transparency=15
end
