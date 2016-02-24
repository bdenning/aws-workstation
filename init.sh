#!/bin/bash

cd /root/

## Configure golang development software
dnf update -y
dnf install -y git emacs-nox golang make tmux
mkdir src lib bin
echo "export GOPATH=/root" >> /root/.bashrc
echo "export PATH=$PATH:$GOPATH/bin" >> /root/.bashrc
source /root/.bashrc

## Grab a bunch of useful go utilities
for tool in godoc cover gorename goimports oracle vet; do
    go get golang.org/x/tools/cmd/$tool
done

## Grab emacs and tmux config files
curl -O https://raw.githubusercontent.com/bdenning/aws-workstation/master/.emacs
curl -O https://raw.githubusercontent.com/bdenning/aws-workstation/master/.tmux.conf

## Install go-mode for emacs
emacs --eval "(package-install 'go-playground)" &

## Install and configure docker
dnf install -y docker
systemctl enable docker
systemctl start docker
