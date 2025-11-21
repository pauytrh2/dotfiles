#
# pauytrh's config.fish
#

# set up tools
source (/usr/bin/starship init fish --print-full-init | psub)
fzf --fish | source
zoxide init fish | source
fish_config theme choose "Dracula Official"

# if status --is-interactive
#     wal -i ~/Pictures/colors.png &>/dev/null &
#     disown
# end

# variables
set -g PAGER bat
set -g EDITOR nvim
set -g LIBCLANG_PATH /usr/lib

# abbr's
abbr -a c clear
abbr -a ls "exa --icons"
abbr -a l "exa --icons"
abbr -a x exit
abbr -a n nvim
abbr -a y yay
abbr -a ys "yay -S --noconfirm"
abbr -a yr "yay -Rns --noconfirm"
abbr -a py python
abbr -a lg lazygit
abbr -a cl "clear;exa --icons"
abbr -a hdh "echo all | history delete history"
abbr -a hd "history delete"
abbr -a vc "cd ~/.config/nvim/;$EDITOR init.lua"
abbr -a fc "cd ~/.config/fish;$EDITOR config.fish"
abbr -a hypr "cd ~/.config/hypr;$EDITOR hyprland.conf"
abbr -a disk "cd /;sudo ncdu;cd -"
abbr -a icat "kitty +kitten icat"
abbr -a cm cmatrix
abbr -a ca "cargo add"
abbr -a cr "cargo run"
abbr -a cf "cargo fmt"
abbr -a cc "cargo clippy"
abbr -a cfr "cargo fmt;cargo clippy;cargo run"
abbr -a timeshift "sudo timeshift --snapshot-device /dev/nvme0n1p2"
abbr -a grep rg
abbr -a htop "htop -t"
abbr -a lrc "cd /home/pauytrh/Code/;sort lrc.txt | uniq | fzf;nvim lrc.txt"
abbr -a fm "yazi"
abbr -a cd "z"

# update
function up
    sudo timeshift --create && yay --noconfirm
end

# yay thingy
function yay
    if test "$argv[1]" = -R
        set argv (string split ' ' (string join ' ' $argv[2..-1]))
        command yay -Rns $argv
    else
        command yay $argv
    end
end

# monthly maintenance script
function monthly
    echo ----------------------------------------------------
    echo "CLEARING PACMAN CACHE"
    echo ----------------------------------------------------

    set pacman_cache_space_used (sudo du -sh /var/cache/pacman/pkg/ | cut -f1)
    echo "Space currently in use: $pacman_cache_space_used"
    echo ""
    echo "Clearing Cache, leaving newest 2 versions:"
    paccache -vrk2
    echo ""
    echo "Clearing all uninstalled packages:"
    paccache -ruk0

    echo ""
    echo ----------------------------------------------------
    echo "REMOVING ORPHANED PACKAGES"
    echo ----------------------------------------------------

    set orphaned (yay -Qdtq)
    if test -n "$orphaned"
        echo $orphaned | yay -Rns -
    else
        echo "No orphaned packages to remove."
    end

    echo ""
    echo ----------------------------------------------------
    echo "CLEARING HOME CACHE"
    echo ----------------------------------------------------

    set home_cache_used (du -sh ~/.cache | cut -f1)
    echo "Clearing ~/.cache/..."
    rm -rf ~/.cache
    echo "Space saved: $home_cache_used"

    echo ""
    echo ----------------------------------------------------
    echo "CLEARING SYSTEM LOGS"
    echo ----------------------------------------------------

    sudo journalctl --vacuum-time=7d
    echo ""
end

# cdls
function cdls
    if test (count $argv) -eq 0
        cd ~; and exa --icons
    else
        cd $argv[1]; and exa --icons
    end
end

# cdto
function cdto
    mkdir $argv[1]
    cd $argv[1]
end

# linux-discord-rich-presence
function ldrp
    linux-discord-rich-presence -c ~/.config/richrc
end

function asm
    if test (count $argv) -lt 1
        echo "Usage: asm_build <filename_without_extension>"
        return 1
    end

    set name $argv[1]
    nasm -f elf64 -o $name.o $name.asm
    if test $status -ne 0
        echo "nasm failed"
        return 1
    end

    ld -o $name $name.o
    if test $status -ne 0
        echo "ld failed"
        return 1
    end

    echo "Build complete: '$name'"
    echo "Running '$name'..."

    ./$name

    rm $name $name.o
end

# fish_greeting
function fish_greeting
    hyfetch
end

