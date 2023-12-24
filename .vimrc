" Vim Script Configuration
" Author: Caesar
" Last Updated: 2023/12/24

" Display a smiling cat at start-up
echom ">^.^<"

" Vim plug Plugin manager
call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Adds syntax highlighting to NERDTree based on filetype.
Plug 'christoomey/vim-tmux-navigator'
Plug 'rose-pine/vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Basic settings
set conceallevel=1
set nocompatible
set number relativenumber
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set backspace=indent,eol,start
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set linebreak
set wrap

set breakindent
set breakindentopt=shift:2
set laststatus=2
set cursorline
set cursorcolumn
set hlsearch
set incsearch
set ignorecase
set smartcase
set ruler
set belloff=all
set visualbell t_vb=
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=99
set background=dark
set noshowmode
set wildmenu
set wildmode=list:longest,full
set completeopt=menuone,menu,longest,preview
set complete=.,w,b,u,t
set completefunc=CompleteCustom
set tags=./tags,tags;$HOME
set showtabline=1
set hidden

syntax on
filetype plugin on

" Status Line configuration
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Coc Setup 
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

let mapleader=" "
let javaScript_fold=1

let g:disable_bg = 1

let g:tmux_navigator_no_mappings = 1

let g:NERDTreeGitStatusConcealBrackets = 1
let g:NERDTreeGitStatusUseNerdFonts = 1 
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_removed_above_and_below = ''
let g:gitgutter_sign_modified_removed = ''

" Cursor style
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let g:javascript_enable_domhtmlcss = 1

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
let g:NERDTreeMinimalUI=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 30

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/
let g:yats_host_keyword = 1
let g:yats_close_tags = 1
let g:yats_filetypes = ['typescript', 'typescriptreact']
let g:typescript_conceal_function             = "ƒ"
let g:typescript_conceal_null                 = "ø"
let g:typescript_conceal_undefined            = "¿"
let g:typescript_conceal_this                 = "@"
let g:typescript_conceal_return               = "⇚"
let g:typescript_conceal_prototype            = "¶"
let g:typescript_conceal_super                = "Ω"

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

highlight GitGutterAdd    guifg=#b5bd68 guibg=NONE  ctermfg=107 ctermbg=NONE
highlight GitGutterChange guifg=#81a2be guibg=NONE  ctermfg=109 ctermbg=NONE
highlight GitGutterDelete guifg=#cc6666 guibg=NONE  ctermfg=167 ctermbg=NONE

" Function to toggle NERDTree
function! ToggleNERDTree()
    if exists("t:NERDTreeIsOpen") && t:NERDTreeIsOpen
        NERDTreeClose
        let t:NERDTreeIsOpen = 0
    else
        NERDTreeFind
        let t:NERDTreeIsOpen = 1
    endif
endfunction

" File Manager
nnoremap <silent> <leader>e :call ToggleNERDTree()<cr>
nnoremap <leader>fw :Rg<cr>
nnoremap <leader>ff :GitFiles<cr>

" Quick write and exit
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>

" Navigation remap
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0
nnoremap <up> <NOP>
nnoremap <down> <Nop>
nnoremap <right> <Nop>
nnoremap <left> <Nop>

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" Buffers
nnoremap <silent> [b :if bufexists(bufnr('#') - 1) \| bprev \| else \| echoerr "No previous buffer" \| endif<CR>
nnoremap <silent> ]b :if bufexists(bufnr('#') + 1) \| bnext \| else \| echoerr "No next buffer" \| endif<CR>
nnoremap <leader>bl :buffers<cr>
nnoremap <leader>b :buffer<space>
nnoremap <leader>bh :sb<cr>
nnoremap <leader>bv :vsp<cr>
nnoremap <leader>ba :%bd\|e#\|bd#<cr>
nnoremap <leader>c :bdelete<cr>

" Copy to system clipboard
nnoremap <leader>yy "+yy
nnoremap <leader>/ :Commentary<cr>

nnoremap <leader>i :f<cr>

" Coc code actions
nnoremap <silent> K :call CocAction('doHover')<cr>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <leader>so :source ~/.vimrc<cr>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent> jj <esc>
vnoremap <leader>y "+y
vnoremap <leader>/ :Commentary<cr> 

colorscheme rosepine

function! CompleteCustom(findstart, base)
  if a:findstart
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\k'
      let start -= 1
    endwhile
    return start
  else
    let part = strpart(getline('.')[col('.') - 1:], 0, a:base - 1)
    let candidates = YourCompletionFunction(part)
    return filter(candidates, 'v:val =~ "^" . a:base')
  endif
endfunction

if exists('+termguicolors') && &termguicolors
  hi Cursor guifg=#FFA500 guibg=#1A1A1A
else
  hi Cursor ctermfg=208 ctermbg=234
endif

let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if has('unnamedplus')
      set clipboard=unnamed,unnamedplus
endif
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

