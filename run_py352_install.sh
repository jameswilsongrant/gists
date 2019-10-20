#!/bin/bash
homebrew install pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
CFLAGS="-I$(xcrun --show-sdk-path)/usr/include" pyenv install -v 3.5.2
mkdir -p ~/.cache/pip
echo 'export PATH="${PATH}:~/.pyenv/versions/3.5.2/bin/"' >> ~/.bash_profile
echo "Restart your shell and try python3"
echo "You should also run pip3 install --upgrade pip to get pip up to date"
