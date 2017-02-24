execute pathogen#infect()
syntax on
filetype plugin indent on

" Make Vim more useful
set nocompatible
" Show "invisible" characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Enable line numbers
set number
" Highlight current line
set cursorline
" Use relative line numbers
if exists("&relativenumber")
    set relativenumber
    au BufReadPost * set relativenumber
endif

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

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

" vim-markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'c', 'cpp']

" Multiple cursors
let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'
