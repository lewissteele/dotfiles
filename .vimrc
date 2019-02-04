if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'Shougo/deoplete.nvim'
    Plug 'StanAngeloff/php.vim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'airblade/vim-gitgutter'
    Plug 'hashivim/vim-terraform'
    Plug 'jremmen/vim-ripgrep'
    Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
    Plug 'junegunn/fzf.vim'
    Plug 'kristijanhusak/deoplete-phpactor'
    Plug 'leafgarland/typescript-vim'
    Plug 'moby/moby' , {'rtp': '/contrib/syntax/vim/'}
    Plug 'mxw/vim-jsx'
    Plug 'pangloss/vim-javascript'
    Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'w0rp/ale'
call plug#end()

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'php': ['phpcbf']
\}
let g:ale_php_phpcbf_standard = "PSR2"
let g:ale_php_phpcs_standard = "PSR2"
let g:ale_sign_column_always = 1
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:deoplete#enable_at_startup = 1
let g:javascript_plugin_jsdoc = 1
let g:terraform_align = 1

let NERDTreeMinimalUI = 1
let loaded_matchparen = 1
let php_htmlInStrings = 1
let php_sql_query = 1

set backspace=indent,eol,start
set clipboard=unnamed
set expandtab
set hlsearch
set ignorecase
set incsearch
set noswapfile
set number
set shiftwidth=4
set smartindent
set spelllang=en_gb
set synmaxcol=200
set tabstop=4
set wildmode=longest,list,full

inoremap jj <esc>
nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap <c-p> :GFiles<cr>
tnoremap <esc> <c-\><c-n>
