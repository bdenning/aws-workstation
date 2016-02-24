#!/bin/bash

cd /root/

## Configure golang development software
dnf update -y
dnf install -y git emacs-nox golang make tmux
mkdir src lib bin
echo "export GOPATH=/root/" >> /root/.bashrc
source /root/.bashrc

## Grab emacs and tmux config files
#curl -O https://gist.githubusercontent.com/bdenning/71dec3778772ed653aae/raw/9bcd50cdbc622d6fd971f6f24cc3db83069d85b8/.emacs
#curl -O https://gist.githubusercontent.com/bdenning/aea289a3b4d194135555/raw/18f9fb35c64b217a6fdbb438797a9b88935cba2d/.tmux.conf

## Configure docker
dnf install -y docker
systemctl enable docker
systemctl start docker
