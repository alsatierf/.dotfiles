export DEFAULT_USER=$USER
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"

set_aliases() {
  # .dotfiles git project alias
  alias dotf="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
  # Sources .zshrc
  alias zs="source $HOME/.zshrc"
  # Opens .zshrc file for edit
  alias ze="$(select_default_editor) $HOME/.zshrc"
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

# Exports the chosen command line editor
select_default_editor() {
  # Checks if nvim is present
  type nvim >/dev/null 2>&1 && nvim_present=$?
  # Checks if vim is present
  type vim >/dev/null 2>&1 && vim_present=$?
  ## Checks if vi is present
  type vi >/dev/null 2>&1 && vi_present=$?
  (([[ $nvim_present -eq 0 ]] && echo "nvim" ) || ([[ $vim_present -eq 0 ]] && echo "vim") || ([[ $vi_present -eq 0 ]] && echo "vi"))
}

install_ohmyzsh_themes() {
  # Downloads powerlevel10k theme to .oh-my-zsh themes folder
  if [[ ! -d $ZSH_CUSTOM/themes/powerlevel10k ]]; then
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
  fi
}

set_ohmyzsh_theme() {
  # Sets zsh theme
  ZSH_THEME="agnoster"
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

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

set_aliases
install_fonts
install_zsh_plugins
install_ohmyzsh_plugins
install_ohmyzsh_themes
set_ohmyzsh_theme

# Checks if pyenv is present
type pyenv >/dev/null 2>&1
pyenv_present=$?

if [[ $pyenv_present -eq 0 ]] then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
