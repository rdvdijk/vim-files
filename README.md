# Iain's New And Shiny Vim Config™

My Vim config files. To be cloned in `~/.vim`

After cloning, create a `~/.vimrc` file with this in it:

``` vim
source ~/.vim/rc/vim.vim
```

And create a `~/.gvimrc` file with this in it:

``` vim
source ~/.vim/rc/gvim.vim
```

And run:

```
cd ~/.vim/
git submodule update --init
./install-command-t
```
