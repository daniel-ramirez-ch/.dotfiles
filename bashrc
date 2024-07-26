# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias code='nvim ~/Code'
alias lg='lazygit'

# Functions

# Update and upgrade
function gm() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y
  sudo apt clean
  rustup update
  asdf plugin update --all
}

# Create a new directory and enter it
take ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

# Find in history
fh() {
  history | grep "$1"
}

# Promt customization
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
. "$HOME/.cargo/env"

# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

