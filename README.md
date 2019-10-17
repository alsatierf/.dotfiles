# .dotfiles

## Setting up a .dotfiles project

```
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
grep -q "alias dotfiles=" $HOME/.bashrc || echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
grep -q "alias dotfiles=" $HOME/.zshrc || echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

## Versioning files in the project

Wherever you are supposed to use `git` command use the `dotfiles` alias (defined above) instead. 
Set a `GIT_URL` env var to point to your .dotfiles project (*e.g.* GIT_URL=https://github.com/alsfreitaz/.dotfiles.git).

```
dotfiles remote add origin $GIT_URL
dotfiles status
dotfiles add .zshrc
dotfiles commit -m "Added .zshrc"
dotfiles add .bashrc
dotfiles commit -m "Added .bashrc"
dotfiles push -u origin master
```

## Cloning the project to a new environment

Set a `GIT_URL` env var to point to your .dotfiles project (*e.g.* GIT_URL=https://github.com/alsfreitaz/.dotfiles.git).


```
git clone --bare $GIT_URL $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
```

> If you have an error message because of already existing files in your $HOME, you can either delete them or back them up and then retry cloning.

## Articles

https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b
