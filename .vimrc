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

" NERDtree

" How can I open NERDTree automatically when vim starts up on opening a
" directory?
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" How can I map a specific key or shortcut to open NERDTree?
map <C-n> :NERDTreeToggle<CR>
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fugitive
set statusline=%{fugitive#statusline()}
