#!/usr/bin/env bash
set -eu
set -o pipefail

# Script to setup ZSH with oh-my-zsh

if [[ -z $(command -v zsh) ]]; then
    echo "Installing ZSH..."
    echo ""
    echo "Running apt-get update..."
    echo ""
    sudo apt-get update
    sudo apt-get install -y zsh curl git
fi

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Getting zsh-syntax-highlighting & zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Adding Plugins in .zshrc file
sed -i "s/plugins=(git)/plugins=(git command-not-found ansible branch docker docker-compose gpg-agent python rsync screen themes zsh_reload zsh-autosuggestions zsh-syntax-highlighting)/" ~/.zshrc

# Adding custom functions and alias
curl -s https://raw.githubusercontent.com/crazyuploader/Misc/master/functions >> ~/.zshrc
echo "Script Finished..."
