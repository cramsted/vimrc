#!/bin/bash

cvim() {
    vim -u ~/cvimrc $@
}

install_node() {
if ! command -v node &> /dev/null
then
    echo "Nodejs not found. Installing now"
    curl -sL install-node.now.sh/lts | bash
fi
}

for arg in "$@"
do
    case $arg in
        -i|--install)
        cp .vimrc ~/cvimrc
        # setup bashrc
        echo "alias cvim='vim -u ~/cvimrc'" >> ~/.bashrc
        # install dependancies
        # vim plug
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        install_node
        cvim +'PlugInstall' +qa
        shift
        ;;
        -c|--consolidate)
        cp ~/cvimrc .vimrc
        cp -r ~/.fzf .
        cp -r ~/.config/coc .
        cp -r ~/.vim/plugged .
        ;;
        
#        SHOULD_INITIALIZE=1
#        shift # Remove --initialize from processing
#        ;;
#        -c=*|--cache=*)
#        CACHE_DIRECTORY="${arg#*=}"
#        shift # Remove --cache= from processing
#        ;;
#        -r|--remote)
#        ROOT_DIRECTORY="$2"
#        shift # Remove argument name from processing
#        shift # Remove argument value from processing
#        ;;
#        *)
#        OTHER_ARGUMENTS+=("$1")
#        shift # Remove generic argument from processing
#        ;;
    esac
done
