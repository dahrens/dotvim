execute pathogen#infect()
filetype plugin indent on

set encoding=utf-8
set nu
set expandtab
set tabstop=4
set shiftwidth=4

syntax on
:color cobalt

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

map <F2> :NERDTreeToggle<CR>
set pastetoggle=<F3>

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
