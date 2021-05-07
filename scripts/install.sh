#!/bin/bash


sudo apt update

# set up vscode repo

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# remove possible conflictions

sudo apt remove docker docker-engine docker.io containerd runc

# install docker

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# set up repo for i3

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update

# install apt packages
cat ~/.dotfiles/pkgs | xargs -t sudo apt-get install -y


# install go

curl https://golang.org/dl/go1.16.4.linux-amd64.tar.gz -o /usr/local/go1.16.4.linux-amd64.tar.gz

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz



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
