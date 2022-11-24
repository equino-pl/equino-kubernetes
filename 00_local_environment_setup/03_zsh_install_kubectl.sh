#!/bin/bash

# Kubectl
arkade get kubectl
# Kubectl zsh completion
echo 'source <(kubectl completion zsh)' >>~/.zshrc
# starting zsh completion
source ~/.zshrc

