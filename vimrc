execute pathogen#infect()
filetype plugin indent on

set modeline
set modelines=5

set encoding=utf-8
set nu
set expandtab
set tabstop=2
set shiftwidth=2

" search
set ignorecase
set incsearch
set hlsearch

"mouse
set mouse=a
set mousemodel=extend

:color cobalt
:hi Directory guifg=#FF0000 ctermfg=red
:highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
:match ExtraWhitespace /\s\+$/

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:ctrlp_extensions = ['tag']

noremap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>

" fzf bindings
noremap <F4> :FZF<CR>
inoremap <F4> <esc>:w<CR>:FZF<CR>

" launch current file
nnoremap <F5> :!%:p<CR>

" ctrl+s make sure: stty -ioxn
noremap <silent> <C-S> :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let mapleader = ","

noremap <leader>ev :vsp $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>

" Move current line up or down
noremap <leader>- ddp
noremap <leader>+ ddkkp

" buffer management
noremap <leader>h :bp<CR>
noremap <leader>l :bn<CR>
noremap <leader>w :bd<CR>

" inoremap <esc> <nop>
inoremap jk <esc>

nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen
    " redraw!
endfunction
