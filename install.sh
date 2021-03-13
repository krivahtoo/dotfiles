#!/usr/bin/env zsh

set -e

git=false

while (( $# > 1 )); do case $1 in
    --git) git=true;;
    *) break;
  esac; shift 2
done


ZSH_FILE=$HOME/.zshrc
if [[ -f "$ZSH_FILE" ]]; then
    echo "$ZSH_FILE exists."
    echo "Creating backup: $(tput setaf 5).zshrc-pre-dotfiles$(tput sgr0)"
    exec mv $ZSH_FILE $HOME/.zshrc-pre-dotfiles
fi

echo "$(tput setaf 5)Creating symlinks to config and bin files...$(tput sgr0)"

exec ln -s "$(dirname "$(readlink -f "$0")")/.zshrc" $ZSH_FILE
exec ln -s "$(dirname "$(readlink -f "$0")")/bin" $HOME/.bin

if $git; then
    echo "$(tput setaf 5)Setting up git...$(tput sgr0)"

    echo "Enter your name."
    read name
    echo "Enter your email."
    read email

    exec git config --global user.name "$name"
    exec git config --global user.email "$email"
fi

echo "$(tput setaf 5)Clonning Oh My Zsh...$(tput sgr0)"

exec git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh

echo "$(tput setaf 5)Clonning Zsh syntax highlighting...$(tput sgr0)"

exec git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "$(tput setaf 5)Clonning PowerLevel10k...$(tput sgr0)"

exec git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
