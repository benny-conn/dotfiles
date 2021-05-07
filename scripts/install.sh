#!/bin/bash

cat ~/.dotfiles/pkgs | xargs -t sudo apt-get install -y

rm ~/.config/i3/config
rm ~/.config/i3/i3blocks.conf
rm ~/.zshrc
rm ~/.zshrc.pre-oh-my-zsh
rm ~/.fehbg


ln -s ~/.dotfiles/i3/config ~/.config/i3/config
ln -s ~/.dotfiles/i3/i3blocks.conf ~/.config/i3/i3blocks.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.zshrc.pre-oh-my-zsh ~/.zshrc.pre-oh-my-zsh
ln -s ~/.dotfiles/.fehbg ~/.fehbg
