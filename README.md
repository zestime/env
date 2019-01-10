
### NeoVim

#### Basic Environmental Variables


```
> export VIMCONFIG=~/.config/nvim
> export VIMDATA=~/.local/share/nvim
```


```
> mkdir -p $VIMCONFIG/pack/bundle/start
> mkdir -p $VIMDATA/undo

```


#### Pre-Requisite 

```
> pip3 install --user --upgrde neovim
```
install minpac, this added as a submodule. So, when you clone this repository, clone with submodules


#### RG

#### FZF

```
> $VIMCONFIG/pack/minpac/start/fzf/install --bin
```

And you should confirm the **bin** folder is included in your $PATH. Otherwise, you add this line at your zshrc.

```
export PATH=$PATH:$VIMCONFIG/pack/minpac/start/fzf/bin
export FZF_DEFAULT_COMMAND='rg --files'
```

Or, you can use 'git ls-files' for the default command of FZF.




# Usage

### NeoVim

#### FZF

```<C-p>```is the key which is running FZF. In FZF, 

- ```<C-v>``` should create new pane vertically.
- ```<C-x>``` new horizontal split 
- ```<C-t>``` open new tab page
- ```<C-c>``` Close the FZF picker
