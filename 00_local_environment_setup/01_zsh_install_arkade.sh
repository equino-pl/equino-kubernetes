#!/bin/bash

# Arkade
curl -SLfs https://dl.get-arkade.dev | sudo sh
# Add tools bin directory to PATH
echo "export PATH=\$HOME/.arkade/bin:\$PATH" >> ~/.zshrc
# Copy zsh completion script
arkade completion zsh > ~/.arkade/arkade_zsh_completion.sh
echo "source ~/.arkade/arkade_zsh_completion.sh" >> ~/.zshrc
# starting zsh completion
source ~/.zshrc
