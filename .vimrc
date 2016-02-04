if has("win32") && has("python")
python << EOF
import os
import re
path = os.environ["PATH"].split(";")

def contains_msvcr_lib(folder):
	try:
		for item in os.listdir(folder):
			if re.match(r"msvcr\d+\.dll", item):
				return True
	except:
		pass
	return False

path = [folder for folder in path if not contains_msvcr_lib(folder)]
os.environ["PATH"] = ";".join(path)
EOF
endif

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
let g:airline_theme="base16"
set background=dark
set laststatus=2
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
let g:airline_theme="molokai"

" Ugh, tab settings
set tabstop=4 shiftwidth=4 softtabstop=4 smarttab
autocmd FileType ruby,typescript,javascript
			\ setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType c setlocal cindent
autocmd FileType python setlocal expandtab

" Stupid terminal settings
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set term=xterm
set t_Co=256

" Stupid Windows settings
if has("win32")
	if !has("gui_running") && !empty($CONEMUBUILD)
		let &t_AB="\e[48;5;%dm"
		let &t_AF="\e[38;5;%dm"
		colorscheme molokai
		let g:airline_theme="molokai"
	else
		set guifont=Hack:h10
		let g:airline_theme="base16"
	endif
endif

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

" Bufferline
let g:bufferline_echo=0

" Pencil
augroup pencil
	autocmd!
	autocmd FileType markdown,mkd call pencil#init()
augroup END

let g:pencil#cursorwrap=1
let g:airline_section_x="%{PencilMode()}"

