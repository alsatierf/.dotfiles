export DEFAULT_USER=$USER
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

# Checks if nvim is present
type nvim >/dev/null 2>&1 && nvim_present=$?
# Checks if vim is present
type vim >/dev/null 2>&1 && vim_present=$?
# Checks if vi is present
type vi >/dev/null 2>&1 && vi_present=$?

EDITOR=$(([[ $nvim_present -eq 0 ]] && echo "nvim" ) || ([[ $vim_present -eq 0 ]] && echo "vim") || ([[ $vi_present -eq 0 ]] && echo "vi"))

# .dotfiles git project alias
alias dotf="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# Sources .zshrc
alias zs="source $HOME/.zshrc"
# Opens .zshrc file for edit
alias ze="$EDITOR $HOME/.zshrc"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# Installs Powerline fonts
if [[ ! -d fonts ]] then
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd -
fi

# Sets zsh theme
ZSH_THEME="agnoster"

# Downloads powerlevel10k theme to .oh-my-zsh themes folder
if [[ $ZSH_THEME == "powerlevel10k/powerlevel10k" ]] && [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]]; then
  git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

# Installs external plugins that are going to be used by oh-my-zsh
[[ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]] &&
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
[[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]] &&
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Defines which .oh-my-zsh plugins should be loaded 
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Downloads and sets fuzzy finder 
if [[ ! -d $HOME/.fzf ]] then
  git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
  echo "y\ny\ny\n" | $HOME/.fzf/install
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Checks if pyenv is present
type pyenv >/dev/null 2>&1
pyenv_present=$?

if [[ $pyenv_present -eq 0 ]] then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
