#!/bin/bash

# design

# install
#   1. local install
#   2. clean installs
#   3. use a keyword for customizing the fzf.bash and bashrc
#   4. network install

# wishlist
#   - ripgrep


if ! command -v node &> /dev/null
then
    echo "Nodejs not found. Installing local version."
    cp bin/node-v12.18.4-linux-x64/bin/* /usr/local/bin
fi

cp .vimrc ~/cvimrc
cp -r .fzf ~/
cp -r .fzf.bash ~/
mkdir ~/.config
cp -r coc ~/.config/
mkdir ~/.vim
cp -r plugged ~/.vim/

if grep -Fxq "alias cvim='vim -u ~/cvimrc'" ~/.bashrc
then
    echo "alias cvim='vim -u ~/cvimrc'" >> ~/.bashrc
fi


if grep -Fxq "source ~/.fzf.bash" ~/.bashrc
then
    echo "source ~/.fzf.bash" >> ~/.bashrc
fi
