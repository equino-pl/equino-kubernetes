#!/bin/bash

curl -L https://github.com/kubernetes/kompose/releases/download/v1.27.0/kompose-darwin-amd64 -o kompose

chmod +x kompose
sudo mv ./kompose /usr/local/bin/kompose

# Completion zsh
echo 'source <(kompose completion zsh)' >>~/.zshrc
source ~/.zshrc
