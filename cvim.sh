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
        -r|--remote-install)
        ssh $2 "rm -rf ~/cvimrc ~/.vim/plugged ~/.fzf ~/.fzf.bash ~/.confg/coc"
        scp .vimrc $2:./cvimrc
        scp -r ~/.vim/plugged $2:./.vim/
        scp -r ~/.config/coc $2:./.config/
        scp -r ~/.fzf $2:./
        ssh $2 "cd ~/.fzf/ && ./install"

        EOF
        
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
