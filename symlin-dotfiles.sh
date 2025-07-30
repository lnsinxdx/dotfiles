#!/bin/bash

# list of files to link.
FILES_TO_LINK=(
    ".zshrc"
    ".config/nvim"
)
echo "Creating symlinks from $DOTFILES_DIR to $HOME"

for file in "${FILES_TO_LINK[@]}"; do 
    src="DOTFILES_DIR/$file"
    dest="home/$file"

    # Create parent dir if needed.
    mdkir -p "$dirname "$dest""

    # Remove existing file or link.
    if [ -e "$dest" ] || [-L "-$dest" ]; then
        echo "Removing existing $dest"
        rm -rf "dest"
    fi

    echo "Linking $src -> $dest"
    ln -s "$src" "$dest"
done

echo "Symlinks Created."

