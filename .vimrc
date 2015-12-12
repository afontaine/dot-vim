set nocompatible

" Enable pathogen
execute pathogen#infect()

" Mappings
map <C-n> :NERDTreeToggle<cr>

" Set base16 color space
let base16colorspace=256

" Keymappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Various vim settings
set number
set noshowmode
set ignorecase
set smartcase
set guifont=Hack\ 12
colorscheme base16-monokai
set background=dark
set laststatus=2
set splitbelow
set splitright

" Enable syntax and filetypes and set patterns for filetypes
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.l set filetype=lisp
au BufRead,BufNewFile *.md set filetype=ghmarkdown

" Keep things at a specific line length
highlight OverLength ctermbg=161 ctermfg=white guibg=#FFD9D9
autocmd FileType c,cpp,markdown,ghmarkdown,gitcommit,ruby,python,lisp
  \ match OverLength /\%>80v.\+/
autocmd FileType java match OverLength /\%>120v.\+/

" Enable spell check
autocmd FileType markdown,ghmarkdown setlocal spelllang=en_ca
autocmd FileType markdown,ghmarkdown setlocal spell

" Ugh, tab settings
set tabstop=4 shiftwidth=4 softtabstop=4 smarttab
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType c setlocal cindent
autocmd FileType python setlocal expandtab

" Stupid terminal settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set term=xterm
set t_Co=256

" Stupid Windows settings
if has('win32') && !has('gui_running') && !empty($CONEMUBUILD)
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
  colorscheme molokai
endif

" Airline stuff
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
