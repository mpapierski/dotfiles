execute pathogen#infect()
syntax on
filetype plugin indent on

" Enable vim-solarized theme

" This fixes nasty colors
let g:solarized_termcolors=256
if has('gui_running')
    set background=light
else
    set background=dark
endif

colorscheme solarized

" CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
