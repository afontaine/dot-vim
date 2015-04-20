map <C-n> :NERDTreeToggle<cr>
execute pathogen#infect()
syntax on
filetype plugin indent on
set number
let g:airline_theme='molokai'
autocmd FileType markdown,ghmarkdown setlocal spelllang=en_ca
autocmd FileType markdown,ghmarkdown setlocal spell
set tabstop=4 shiftwidth=4 softtabstop=4 smarttab
autocmd FileType c setlocal cindent
autocmd FileType python setlocal expandtab
set laststatus=2
set encoding=utf-8
let &termencoding=&encoding
set t_Co=256
colors molokai
highlight OverLength ctermbg=161 ctermfg=white guibg=#FFD9D9
let g:airline_powerline_fonts=1
au BufRead,BufNewFile *.l set filetype=lisp
autocmd FileType c,cpp,markdown,ghmarkdown,gitcommit,ruby,python,lisp match OverLength /\%>80v.\+/
autocmd FileType java match OverLength /\%>120v.\+/
set noshowmode
