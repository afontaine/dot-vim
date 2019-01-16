set nocompatible

let mapleader = "\<Space>"

call plug#begin()
Plug 'chriskempson/base16-vim'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' } | Plug 'junegunn/limelight.vim'

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'

Plug 'gabrielelana/vim-markdown'
Plug 'reedes/vim-pencil'

Plug 'mhinz/vim-signify'

Plug 'sheerun/vim-polyglot'

Plug 'neoclide/coc.nvim', { 'do': { -> coc#util#install() } }

Plug 'tpope/vim-dispatch', { 'branch': 'job' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-vinegar'

Plug 'dhruvasagar/vim-prosession'

Plug 'idanarye/vim-merginal'
Plug 'christoomey/vim-tmux-navigator'

Plug 'aklt/plantuml-syntax'

Plug 'bdauria/angular-cli.vim'

Plug 'tmhedberg/matchit'
call plug#end()

" Set base16 color space
let base16colorspace=256

" Keymappings
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

tnoremap <C-J> <C-W>j
tnoremap <C-K> <C-W>k
tnoremap <C-L> <C-W>l
tnoremap <C-H> <C-W>h

nnoremap <Leader>` :botright new <bar> :exe "resize " . (winheight(0) * 2/3) <bar> set wfh <bar> :terminal ++curwin ++close<CR>
nnoremap <Leader>x :w <bar> bd<CR>

if has('gui_running')
  let g:terminal_ansi_colors = [
    \ '#272822',
    \ '#f92672',
    \ '#a6e22e',
    \ '#f4bf75',
    \ '#66d9ef',
    \ '#ae81ff',
    \ '#a1efe4',
    \ '#f8f8f2',
    \ '#75715e',
    \ '#f92672',
    \ '#a6e22e',
    \ '#f4bf75',
    \ '#66d9ef',
    \ '#ae81ff',
    \ '#a1efe4',
    \ '#f9f8f5'
    \ ]
endif

" Various vim settings
set number
set noshowmode
set ignorecase
set smartcase
set hidden
set signcolumn=yes
set encoding=utf-8
set fileencoding=utf-8
set background=dark
set laststatus=2
set backspace=2
set splitbelow
set splitright
set diffopt+=vertical
set noerrorbells visualbell t_vb=
set nowrap
set sessionoptions-=terminal
set autoread
set wildmenu
if !isdirectory($HOME . "/.vim/swapfiles")
  call mkdir($HOME . "/.vim/swapfiles", "p", 0700)
endif
set directory=$HOME/.vim/swapfiles//
if !isdirectory($HOME . "/.vim/backup")
  call mkdir($HOME . "/.vim/backup", "p", 0700)
endif
set backupdir=$HOME/.vim/backup//
au GUIEnter * set visualbell t_vb=


if !&scrolloff
  set scrolloff=1
endif

if !&sidescrolloff
  set sidescrolloff=5
endif


if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif


if executable('rg')
  set grepprg=rg\ --vimgrep
endif

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
au BufRead,BufNewFile *.cfg,*.spc set filetype=xml

" Keep things at a specific line length
highlight OverLength ctermbg=161 ctermfg=white guibg=#FFD9D9
augroup overlength
  autocmd!
  autocmd FileType c,cpp,markdown,gitcommit,ruby,python,lisp
        \ match OverLength /\%>80v.\+/
  autocmd FileType javascript,typescript match OverLength /\%>80v.\+/
  autocmd FileType java match OverLength /\%>120v.\+/
augroup END

" Enable spell check
autocmd FileType markdown,gitcommit setlocal spelllang=en_ca
autocmd FileType markdown,gitcommit setlocal spell
set spellfile=$HOME/.vim-spell-en.utf-8.add
set complete+=kspell

" Ugh, tab settings
set tabstop=2 shiftwidth=2 softtabstop=2 smarttab expandtab
augroup indentsettings
  autocmd!
  autocmd FileType * setlocal tabstop=2 shiftwidth=2 softtabstop=2 smarttab expandtab
  autocmd FileType c setlocal noexpandtab cindent tabstop=8 shiftwidth=8 softtabstop=8 smarttab expandtab
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType xml,csharp setlocal tabstop=3 shiftwidth=3 softtabstop=3
augroup END

" Stupid terminal settings
if !has("gui_running") && !has('nvim')
  set termencoding=utf-8
  set term=xterm
  set t_Co=256
end

" Stupid Windows settings
if has('win32') || has('win64')
  set wildignore+=*\\node_modules\\*,*\\tmp\\*,*.swp,*.zip,*.exe
  if !has('gui_running') && !empty($CONEMUBUILD)
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    colorscheme molokai
    let g:airline_theme="molokai"
  else
    set guifont=Hack:h10
    set guifontwide=Hack:h10
    colorscheme base16-monokai
    let g:airline_theme="base16_monokai"
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
  let g:airline_theme="base16_monokai"
endif

" Sweet keymaps
augroup buffermaps
  autocmd!
  autocmd FileType html,xml :iabbrev <buffer> </ </<C-X><C-O>
augroup END

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

let g:airline_section_x="%{PencilMode()}"


" Fugitive
nnoremap <Leader>m :MerginalToggle<CR>

" FZF
if executable('rg')
  let $FZF_DEFAULT_COMMAND='rg --files'
endif

nnoremap <Leader>p :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Rg<CR>

" Pencil
augroup pencil
  autocmd!
  autocmd FileType markdown call pencil#init()
augroup end

" Markdown
let g:markdown_enable_conceal=1
let g:vim_markdown_frontmatter=1

" Signify
let g:signify_vsc_list = ['git']
let g:signify_realtime = 1
let g:signify_sign_add="➜"
let g:signify_sign_delete="✖"
let g:signify_sign_delete_first_line=g:signify_sign_delete
let g:signify_sign_change="●"
let g:signify_sign_changedelete=g:signify_sign_change


" vim-autocomplete
set completeopt+=preview

augroup autocomplete
  autocmd!
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(), 0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(), 0)}'

inoremap <silent><expr> <c-space> coc#refresh()

nnoremap gb :call CocAction('doHover')<CR>
nnoremap <Leader>t :LspDocumentSymbol<CR>

nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <Leader>. <Plug>(coc-codeaction)
nnoremap <Leader>r <Plug>(coc-rename)
nnoremap <Leader>n <Plug>(coc-diagnostic-next)
nnoremap <Leader>F <Plug>(coc-format-selected)
vnoremap <Leader>F <Plug>(coc-format-selected)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! ChompedSystem( ... )
    return substitute(call('system', a:000), '\n\+$', '', '')
endfunction

" Rainbow Parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]
let g:rainbow#blacklist = ['#ff0000', '#f9f8f5', '#49483e', '#75715e', '#f8f8f2']

augroup rainbow
  autocmd!
  autocmd FileType typescript,javascript,javascript.jsx RainbowParentheses
  autocmd FileType html,xml,eelixir,elixir,ruby RainbowParentheses!
augroup END

" Git
augroup git
  autocmd!
  autocmd FileType gitrebase setlocal bufhidden=delete
augroup END

if executable('git')
   if ChompedSystem('git rev-parse --is-inside-work-tree') == "true"
     let $GIT_EDITOR = "gvim --servername " . v:servername . " --remote-tab-wait"
   endif
endif

set mouse=

