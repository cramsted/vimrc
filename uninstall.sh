#!/bin/bash

rm ~/cvimrc
rm -r ~/.fzf
rm ~/.fzf.bash
rm -r ~/.config/coc
rm -r ~/.vim/plugged
rm -r ~/.vim/autoload

sed -i '/cvimrc/d' ~/.bashrc
sed -i '/.fzf.bash/d' ~/.bashrc

