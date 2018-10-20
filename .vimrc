if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'Shougo/deoplete.nvim'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'kristijanhusak/deoplete-phpactor'
    Plug 'phpactor/phpactor', { 'do': 'composer install' }
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-scripts/vim-auto-save'
    Plug 'w0rp/ale'
    Plug 'zivyangll/git-blame.vim'
call plug#end()

let g:ale_php_phpcs_standard="PSR2"
let g:ale_sign_column_always = 1
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1

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

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <c-p> :GFiles<cr>
tnoremap <esc> <c-\><c-n>

highlight clear SignColumn

if executable('rg')
    set grepprg=rg\ --vimgrep\ --ignore-case
endif

command! -nargs=+ F execute 'silent grep!' <q-args> | cw | redraw!
