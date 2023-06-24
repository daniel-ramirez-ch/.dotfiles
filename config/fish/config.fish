set fish_greeting

abbr --add crc "cargo run --"

set -gx EDITOR nvim

if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end