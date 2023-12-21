call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rose-pine/vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'yuezk/vim-js'
" Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-scripts/loremipsum'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

echom ">^.^<"
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
syntax on
filetype plugin on
let mapleader=" "

nnoremap <leader>e :NERDTreeToggle<cr> " fuzzy finder
nnoremap <leader>fw :Rg<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>ff :GitFiles<cr>
nnoremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <silent> ^ g^
nnoremap <silent> 0 g0
nnoremap <up> :<NOP>
nnoremap <down> :<NOP>
nnoremap <right> :<NOP>
nnoremap <left> :<NOP>

"{ vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"}

" Tabs
nnoremap [b gT
nnoremap ]b gt

" Buffers 
nnoremap <leader>bl :buffers<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bd :bdelete<cr>
" nnoremap <leader>ba :%bd|e#|bd#<cr>
nnoremap <leader>b :buffer<space>
nnoremap <leader>bh :sb<cr>
nnoremap <leader>bv :vsp<cr>
" nnoremap <leader>ba :%bd|e#|bd#<cr>
nnoremap <leader>ba :%bd\|e#\|bd#<cr>

" Copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" vim commentary
vnoremap <leader>/ :Commentary<cr> 
nnoremap <leader>/ :Commentary<cr>

" Quick edit and quick resource
nnoremap <leader>c :vsp ~/.vimrc<cr>
nnoremap <leader>s :source ~/.vimrc<cr>

nnoremap <leader>i :f<cr>

" NERDTreeGit
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  :'✹',
      \ 'Staged'    :'✚',
      \ 'Untracked' :'✭',
      \ 'Renamed'   :'➜',
      \ 'Unmerged'  :'═',
      \ 'Deleted'   :'✖',
      \ 'Dirty'     :'✗',
      \ 'Ignored'   :'☒',
      \ 'Clean'     :'✔︎',
      \ 'Unknown'   :'?',
      \ }

" GitGutter
let g:gitgutter_sign_added = ''
let g:gitgutter_sign_modified = ''
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = ''
let g:gitgutter_sign_removed_above_and_below = ''
let g:gitgutter_sign_modified_removed = ''

highlight GitGutterAdd    guifg=#b5bd68 guibg=NONE  ctermfg=107 ctermbg=NONE
highlight GitGutterChange guifg=#81a2be guibg=NONE  ctermfg=109 ctermbg=NONE
highlight GitGutterDelete guifg=#cc6666 guibg=NONE  ctermfg=167 ctermbg=NONE


" typescript
let g:yats_host_keyword = 1

" yats jsx/tsx automatic tag closing
let g:yats_close_tags = 1
let g:yats_filetypes = ['typescript', 'typescriptreact']

let g:typescript_conceal_function             = "ƒ"
let g:typescript_conceal_null                 = "ø"
let g:typescript_conceal_undefined            = "¿"
let g:typescript_conceal_this                 = "@"
let g:typescript_conceal_return               = "⇚"
let g:typescript_conceal_prototype            = "¶"
let g:typescript_conceal_super                = "Ω"


set conceallevel=1
" vim jsx pretty
" let g:vim_jsx_pretty_disable_js = 0	"default 0	Disable the syntax highlighting for js files
" let g:vim_jsx_pretty_disable_tsx = 0 " default 0	Disable the syntax highlighting for tsx files
" let g:vim_jsx_pretty_template_tags =	['html', 'jsx'] " default ['html', 'jsx']	highlight JSX inside the tagged template string, set it to [] to disable this feature
" let g:vim_jsx_pretty_highlight_close_tag  =	1	"highlight the close tag separately from the open tag
" let g:vim_jsx_pretty_colorful_config = 1 "0	colorful config flag


" set fuzzy-finder opens in new tab by default
let g:fzf_action = { 'enter': 'tab split' }


" statusline
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

set foldmethod=syntax

set background=dark
set noshowmode
let g:disable_bg = 1

" Automatically load session on Vim startup
" autocmd VimEnter * if argc() == 0 && filereadable(expand("~/.vim/session.vim")) | execute 'source ~/.vim/session.vim' | endif
" And save the session on leave 
" autocmd VimLeave * mksession! ~/.vim/session.vim

" Enable line and popup menu in insert mode
set wildmenu
set wildmode=list:longest,full

" Customize the behavior of completion
set completeopt=menuone,menu,longest,preview
set complete=.,w,b,u,t
set completefunc=CompleteCustom

" Define a custom completion function
function! CompleteCustom(findstart, base)
  if a:findstart
    " Locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\k'
      let start -= 1
    endwhile
    return start
  else
    " Get the word to be completed
    let part = strpart(getline('.')[col('.') - 1:], 0, a:base - 1)

    " Perform your custom logic to generate a list of completions
    let candidates = YourCompletionFunction(part)

    " Return the list to be displayed in the popup menu
    return filter(candidates, 'v:val =~ "^" . a:base')
  endif
endfunction

" Map Tab to select the next item in the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Map Enter to close the popup menu and insert the selected item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


" set onmifunc=syntaxcomplete#Complete

" Set block-shaped cursor in normal mode
" augroup myCursor
"   autocmd!
"   autocmd VimEnter,InsertLeave * set guicursor=n-v-c:block
"   autocmd InsertEnter * set guicursor=a:ver25-Cursor
" augroup END

" Reference chart of values:
" Ps = 0 -> blinking block,
" Ps = 1 -> blinking block (default)
" ps = 2 -> steady block
" Ps = 3 -> blinking underline
" Ps = 4 -> steady underline
" Ps = 5 -> blinking bar (xterm)
" Ps = 6 -> steady bar (xterm)
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"

colorscheme rosepine
" highlight CurcorColumn ctermbg=darkmagenta
" hi Cursor guibg=red

if exists('+termguicolors') && &termguicolors
  hi Cursor guifg=#FFA500 guibg=#1A1A1A
else
  hi Cursor ctermfg=208 ctermbg=234
endif
