# Aliases
alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'

# Functions
function gm() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y
  sudo apt clean
  dropbox update
  rustup update
  dropbox start
}

take ()
{
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

# Promt customization
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
. "$HOME/.cargo/env"

