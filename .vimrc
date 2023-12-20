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
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'itchyny/lightline.vim'
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
filetype on
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
nnoremap <up> :echoerr "That doesn't work, use K"<CR>
nnoremap <down> :echoerr "That doesn't work, use J"<CR>
nnoremap <right> :echoerr "That doesn't work, use L"<CR>
nnoremap <left> :echoerr "That doesn't work, use H"<CR>

"{ vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"}

" nnoremap <leader>b :buffers<cr>
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>

" Copy to system clipboard
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy

" vim commentary
vnoremap <leader>/ :Commentary<cr> 
nnoremap <leader>/ :Commentary<cr>

" Quick edit and quick resource
nnoremap <leader>c :edit ~/.vimrc<cr>
nnoremap <leader>s :source ~/.vimrc<cr>

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
let g:vim_jsx_pretty_highlight_close_tag  =	1	"highlight the close tag separately from the open tag
let g:vim_jsx_pretty_colorful_config = 1 "0	colorful config flag


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
autocmd VimEnter * if argc() == 0 && filereadable(expand("~/.vim/session.vim")) | execute 'source ~/.vim/session.vim' | endif
" And save the session on leave 
autocmd VimLeave * mksession! ~/.vim/session.vim




colorscheme rosepine
