#!/bin/bash

if ! ( hash git 2>/dev/null )
then
    echo Please install git
    exit 1
fi

declare -a PLUGINS=(
    "https://github.com/tpope/vim-sensible"             # sensible
    "https://github.com/vim-airline/vim-airline"        # light status
    "https://github.com/tpope/vim-fugitive"             # git
    "https://github.com/vim-syntastic/syntastic"        # syntax checks
    "https://github.com/kien/ctrlp.vim"                 # find mru, buf, f
    "https://github.com/scrooloose/nerdtree"            # find files 
    "https://github.com/ervandew/supertab"              # autocomplete tab
    "https://github.com/othree/yajs.vim"                # javascript
    "https://github.com/tpope/vim-surround"             # wrap blocks
    "https://github.com/SirVer/ultisnips"               # snippet base
    "https://github.com/honza/vim-snippets"             # snippets
    "https://github.com/vim-scripts/AutoClose"          # close brackets
)

GIT_CLONE="git clone --depth 1"
VIMRC=~/.vimrc
DOTVIM=~/.vim

echo "If you proceed I will wipe your $VIMRC"
read -p "Are you sure? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    rm $VIMRC
    ln -s $DOTVIM/vimrc $VIMRC
    for URL in "${PLUGINS[@]}"
    do
        PLUGIN=`printf -- "%s" "${URL##*/}"`
        if [ -d "./bundle/$PLUGIN" ]; then
           echo Already installed: $PLUGIN
        else
            echo Install plugin: $PLUGIN
            $GIT_CLONE $URL ./bundle/$PLUGIN
        fi
    done
fi


