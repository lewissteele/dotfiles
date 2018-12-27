if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'Shougo/deoplete.nvim'
    Plug 'StanAngeloff/php.vim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'Yggdroot/indentLine'
    Plug 'airblade/vim-gitgutter'
    Plug 'hashivim/vim-terraform'
    Plug 'jremmen/vim-ripgrep'
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'kristijanhusak/deoplete-phpactor'
    Plug 'leafgarland/typescript-vim'
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'w0rp/ale'
call plug#end()

let g:ale_php_phpcs_standard="PSR2"
let g:ale_sign_column_always = 1
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:deoplete#enable_at_startup = 1
let g:javascript_plugin_jsdoc = 1

let g:terraform_align=1

let NERDTreeMinimalUI = 1

let php_sql_query = 1
let php_htmlInStrings = 1

syntax on
filetype plugin on

set mouse=a
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set ignorecase
set backspace=indent,eol,start
set incsearch
set clipboard=unnamed
set synmaxcol=200
set noswapfile
set noshowmode
set ttymouse=xterm2
set wildmode=longest,list,full
set hlsearch

nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap <c-p> :GFiles<cr>
tnoremap <esc> <c-\><c-n>
inoremap jj <esc>

"move codeblocks
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

highlight clear SignColumn
