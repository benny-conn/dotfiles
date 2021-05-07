#!/bin/bash


sudo apt update

# set up vscode repo

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

# set up google chrome 

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o ~/Downloads/google-chrome-stable_current_amd64.deb 

sudo apt install ~/Downloads/google-chrome-stable_current_amd64.deb

# remove possible conflictions

sudo apt remove docker docker-engine docker.io containerd runc

# install docker

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

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


# setup git 

git config --global user.name "bennycio"
git config --global user.email benny@bennyc.io
git config --global core.editor vim



cd ~/workspace

git clone git@github.com:bennycio/bundle.git

git clone git@github.com:bennycio/canna-kool-admin-client.git

git clone git@github.com:bennycio/canna-kool-site.git

git clone git@github.com:bennycio/material-ui-pro.git

cd ~/workspace/bundle

go get github.com/gogo/protobuf/protoc-gen-gofast

