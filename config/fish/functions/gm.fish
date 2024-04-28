function gm
    echo "gm, getting everything up to date."
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove
    rustup update
end
