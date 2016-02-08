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
set encoding=utf-8
set fileencoding=utf-8
set background=dark
set laststatus=2
set backspace=2
set splitbelow
set splitright
set diffopt+=vertical
set noerrorbells visualbell t_vb=
au GUIEnter * set visualbell t_vb=

" Plain GUI
set guioptions-=m
set guioptions-=M
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Enable syntax and filetypes and set patterns for filetypes
syntax on
filetype plugin indent on
au BufRead,BufNewFile *.l set filetype=lisp
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.cfg set filetype=xml

" Keep things at a specific line length
highlight OverLength ctermbg=161 ctermfg=white guibg=#FFD9D9
autocmd FileType c,cpp,markdown,gitcommit,ruby,python,lisp
			\ match OverLength /\%>80v.\+/
autocmd FileType java match OverLength /\%>120v.\+/

" Enable spell check
autocmd FileType markdown,gitcommit setlocal spelllang=en_ca
autocmd FileType markdown,gitcommit setlocal spell
set spellfile=$HOME/.vim-spell-en.utf-8.add
set complete+=kspell

" Ugh, tab settings
set tabstop=4 shiftwidth=4 softtabstop=4 smarttab
autocmd FileType ruby,typescript,javascript,json
			\ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType c setlocal cindent
autocmd FileType python setlocal expandtab

" Stupid terminal settings
if !has("gui_running")
	set termencoding=utf-8
	set term=xterm
	set t_Co=256
end

" Stupid Windows settings
if has('win32') || win('win64')
	set wildignore+=*\\node_modules\\*,*\\tmp\\*,*.swp,*.zip,*.exe
	if !has('gui_running') && !empty($CONEMUBUILD)
		let &t_AB="\e[48;5;%dm"
		let &t_AF="\e[38;5;%dm"
		colorscheme molokai
		let g:airline_theme="molokai"
	else
		set guifont=Hack:h10
		set guifontwide=Hack:h10
		if (v:version == 704 && has("patch393")) || v:version > 704
			set renderoptions=type:directx,level:0.75,gamma:1.25,contrast:0.25,
						\geom:1,renmode:5,taamode:1
		endif
	endif
else
	set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip
	set guifont=Hack\ 12
	set guifontwide=Hack\ 12
	colorscheme base16-monokai
	let g:airline_theme="base16"
endif

" Sweet keymaps
iabbrev </ </<C-X><C-O> 

" Airline stuff
let g:airline_powerline_fonts=1
if !exists("g:airline_symbols")
	let g:airline_symbols={}
endif
let g:airline_left_sep=""
let g:airline_left_alt_sep=""
let g:airline_right_sep=""
let g:airline_right_alt_sep=""
let g:airline_symbols.branch=""
let g:airline_symbols.readonly=""
let g:airline_symbols.linenr='¶'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#symbol="◎"

" CtrlP
nnoremap <C-T> :CtrlPTag<CR>

" Syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:synatstic_aggregate_errors=1

let g:syntastic_typescript_checkers=["tsc", "tslint"]
let g:syntastic_typescript_tsc_fname=""
let g:syntastic_ruby_checkers=["mri", "rubocop"]
let g:syntastic_javascript_checkers=["eslint"]

" Signify
let g:signify_sign_delete="-"
let g:signify_sign_delete_first_line="-"
let g:signify_sign_change="~"
let g:signify_sign_changedelete="~"

" Bufferline
let g:bufferline_echo=0

" Gulp
nnoremap <C-G> :CtrlPGulp<CR>
