#!/bin/bash

if ! ( hash git 2>/dev/null )
then
    echo Please install git
    exit 1
fi

if ! ( hash ctags 2>/dev/null )
then
    echo Please install ctags: apt install exuberant-ctags
    exit 1
fi

declare -a PLUGINS=(
    "https://github.com/tpope/vim-sensible"             # sensible
    "https://github.com/tpope/vim-surround"             # wrap blocks
    "https://github.com/tpope/vim-fugitive"             # git
    "https://github.com/vim-airline/vim-airline"        # light status
    "https://github.com/vim-syntastic/syntastic"        # syntax checks
    "https://github.com/tomasr/molokai"                 # color schema
    "https://github.com/kien/ctrlp.vim"                 # find mru, buf, f
    "https://github.com/scrooloose/nerdtree"            # find files 
    "https://github.com/majutsushi/tagbar"              # inspect files
    "https://github.com/ervandew/supertab"              # autocomplete tab
    "https://github.com/plasticboy/vim-markdown"        # markdown
    "https://github.com/pangloss/vim-javascript"        # javascript
)



GIT_CLONE="git clone --depth 1"

for URL in "${PLUGINS[@]}"
do
    PLUGIN=`printf -- "%s" "${URL##*/}"`
    echo process plugin: $PLUGIN
    if [ -d "./bundle/$PLUGIN" ]; then
        echo Already installed
    else
        $GIT_CLONE $URL ./bundle/$PLUGIN
    fi
    #$GITCMD $plugin bundle/
    # or do whatever with individual element of the array
done

VIMRC=~/.vimrc

if [ -f $VIMRC ]
then
    if [ -L $VIMRC ]
    then
        echo Already symlinked
    else
        echo backup your .vimrc
        mv $VIMRC $VIMRC.bak
        echo symlink .vim/vimrc
        ln -s ~/.vim/vimrc $VIMRC
    fi
fi

