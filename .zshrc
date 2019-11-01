export DEFAULT_USER=$USER
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

set_aliases() {
  # .dotfiles git project alias
  alias dotf="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
  # Sources .zshrc
  alias zs="source $HOME/.zshrc"
  # nvim alias
  alias nvim="$HOME/.local/bin/nvim"
  # default editor alias
  alias edit="nvim"
  # Opens .zshrc file for edit
  alias ze="edit $HOME/.zshrc"
}

install_fonts() {
  # Install Powerline fonts
  if [[ ! -d $HOME/fonts ]] then
    git clone https://github.com/powerline/fonts.git --depth=1 $HOME/fonts
    cd $HOME/fonts
    ./install.sh
    cd -
  fi
}

install_external_theme() {
  case "$1" in 
    "powerlevel10k/powerlevel10k")
      # Downloads powerlevel10k theme to .oh-my-zsh themes folder
      if [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]]; then
        git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
      fi
  esac
}

set_ohmyzsh_theme() {
  # Sets zsh theme
  ZSH_THEME="$1"
  # Installs external theme to Oh My Zsh
  install_external_theme ZSH_THEME
  # Defines which .oh-my-zsh plugins should be loaded 
  plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
  # Loads Oh My ZSH
  source $ZSH/oh-my-zsh.sh
}

install_zsh_plugins() {
  # Downloads and sets fuzzy finder 
  if [[ ! -d $HOME/.fzf ]] then
    git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.fzf
    echo "y\ny\ny\n" | $HOME/.fzf/install
  fi
  # Sources fuzzy finder configs
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# Installs external plugins that are going to be used by oh-my-zsh
install_ohmyzsh_plugins() {
  # Zsh sintax highlight
  [[ ! -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]] &&
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  # Zsh autosuggestions
  [[ ! -d $ZSH_CUSTOM/plugins/zsh-autosuggestions ]] &&
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
}

set_pyenv() {
  if [[ -e "$HOME/.pyenv/bin/pyenv" ]] then
    PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
}

set_localbin_path() {
  PATH="$HOME/.local/bin:$PATH"
}

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

set_aliases
install_fonts
install_zsh_plugins
install_ohmyzsh_plugins
set_ohmyzsh_theme "agnoster"
set_pyenv
set_localbin_path
