# My `.vim` folder


## Install

```bash
cd ~
mv .vim .vim.bak  # make a backup of your .vim folder if present
git clone https://github.com/dahrens/dotvim.git .vim
cd .vim && ./install.sh
# edit install.sh and vimrc to customize
```

## Code directly included from:

* https://github.com/tpope/vim-pathogen
* https://github.com/gkjgh/cobalt

## Usage

* **`<F2>`** file tree (on the left)
* **`<F3>`** paste mode toggle
* **`<F4>`** open fuzzy search in file names recursivly below pwd
* **`<F5>`** execute current file
* **`<F8>`** open tag bar (on the right)
* **`<Ctrl-S>`** save in any mode (you need stty -ionx in .bashrc or .zshrc)
* **`<Ctrl-P>`** open fuzzy search use <Ctrl-F> to switch between
			   files, mru, buffers and tags

### Buffers

```
:ls    # list them
:b[n]  # switch to number
:bp    # switch to prev
:bn	   # switch to next
:bd    # close current
:bd[n] # close specific
```

### ctags

Features like outline or jump to definition need to analyze your code.
Therefore you can use ctags which needs to be installed on your machine.

`sudo apt install exuberant-ctags`

Whenever you want to navigate in vim based on ctags information you need to run the analyzes of the code that should be available later.
You need to call this whenever your source files have changed.

If you are in a git empowered project root, use:

```bash
ctags -R -f . ./.git/tags
```

When you have generated a ctags file you can use <Ctrl-]> when on a word to jump to the definition.

Note that ctags needs proper configuration for different languages.

#### JavaScript

I currently use es-ctags together with watch-run to generate the tags on the fly for js empowered projects.

The following makes this available as `npm run watch-esctags` and `npm run esctags`.

```javascript
{
    "scripts": {
        "watch-esctags": "./node_modules/watch-run/bin/watch -p './**' npm run esctags",
        "esctags": "./node_modules/es-ctags/bin/es-ctags -R -f ./.git/tags ."
    },
    "devDependencies": {
        "es-ctags": "0.0.2",
        "watch-run": "^1.2.5",
  }
}
```

