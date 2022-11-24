#!/bin/bash

# Arkade
curl -SLfs https://dl.get-arkade.dev | sudo sh
# Add tools bin directory to PATH
echo "export PATH=\$HOME/.arkade/bin:\$PATH" >> ~/.bashrc
# Copy bash completion script
arkade completion bash > ~/.arkade/arkade_bash_completion.sh
echo "source ~/.arkade/arkade_bash_completion.sh" >> ~/.bashrc
# starting bash completion
source ~/.bashrc
