# Aliases
alias ll='ls -alF'
alias la='ls -A'

# Functions
function gm() {
  sudo apt update
  sudo apt full-upgrade -y
  sudo apt autoremove -y
  sudo apt clean
}
