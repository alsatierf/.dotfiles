# .dotfiles

## Setting up a .dotfiles project

```
git init --bare $HOME/.dotfiles
alias dotf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotf config --local status.showUntrackedFiles no
grep -q "alias dotf=" $HOME/.bashrc || echo "alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
grep -q "alias dotf=" $HOME/.zshrc || echo "alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

## Versioning files in the project

Wherever you are supposed to use `git` command use the `dotf` alias (defined above) instead. 
Set a `GIT_URL` env var to point to your .dotfiles project (*e.g.* GIT_URL=https://github.com/alsfreitaz/.dotfiles.git).

```
dotf remote add origin $GIT_URL
dotf status
dotf add .zshrc
dotf commit -m "Added .zshrc"
dotf add .bashrc
dotf commit -m "Added .bashrc"
dotf push -u origin master
```

## Cloning the project to a new environment

Set a `GIT_URL` env var to point to your .dotfiles project (*e.g.* GIT_URL=https://github.com/alsfreitaz/.dotfiles.git).


```
git clone --bare $GIT_URL $HOME/.dotfiles
alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotf checkout
```

> If you have an error message because of already existing files in your $HOME, you can either delete them or back them up and then retry cloning.

## Articles

https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
