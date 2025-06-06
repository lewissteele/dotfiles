if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'StanAngeloff/php.vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
  Plug 'charlespascoe/vim-go-syntax'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'hashivim/vim-terraform'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'kamykn/spelunker.vim'
  Plug 'mechatroner/rainbow_csv'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pangloss/vim-javascript'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sleuth'
  Plug 'tveskag/nvim-blame-line'
  Plug 'vim-scripts/vim-auto-save'
call plug#end()

let g:coc_global_extensions = [
  \'coc-docker',
  \'coc-json',
  \'coc-phpls',
  \'coc-prettier',
  \'coc-sh',
  \'coc-sql',
  \'coc-toml',
  \'coc-tsserver',
  \'coc-yaml',
\]

let g:PHP_noArrowMatching = 1
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1
let g:rg_command = 'rg --vimgrep --fixed-strings --ignore-case' 
let g:rg_highlight = 1
let g:terraform_align = 1

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let loaded_matchparen = 1
let php_htmlInStrings = 1
let php_sql_query = 1
let php_var_selector_is_identifier = 1

set autoindent
set backspace=indent,eol,start
set clipboard+=unnamedplus
set colorcolumn=81
set expandtab
set hlsearch
set ignorecase
set incsearch
set noswapfile
set nowrap
set number
set shiftwidth=2
set signcolumn=yes
set smartindent
set spelllang=en_gb
set synmaxcol=200
set tabstop=2
set termguicolors
set wildmode=longest,list,full

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <silent> <c-]> <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nnoremap <c-n> :NERDTreeToggle<cr>
nnoremap <c-p> :GFiles<cr>
nnoremap <silent> K :call CocAction('doHover')<cr>
nnoremap p p`]<Esc>
tnoremap <esc> <c-\><c-n>

colorscheme catppuccin-mocha
