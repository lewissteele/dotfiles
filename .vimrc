if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'StanAngeloff/php.vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-css-color'
  Plug 'ciaranm/detectindent'
  Plug 'hashivim/vim-terraform'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'moby/moby', {'rtp': '/contrib/syntax/vim/'}
  Plug 'mxw/vim-jsx'
  Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
  Plug 'pangloss/vim-javascript'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'tomasiser/vim-code-dark'
  Plug 'tpope/vim-fugitive'
  Plug 'tveskag/nvim-blame-line'
  Plug 'vim-scripts/vim-auto-save'
  Plug 'w0rp/ale'

  Plug 'NLKNguyen/papercolor-theme'
call plug#end()

let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_php_phpcbf_standard = "PSR2"
let g:ale_php_phpcs_standard = "PSR2"
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:javascript_plugin_jsdoc = 1
let g:terraform_align = 1

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let loaded_matchparen = 1
let php_htmlInStrings = 1
let php_sql_query = 1
let php_var_selector_is_identifier = 1

set autoindent
set backspace=indent,eol,start
"set clipboard=unnamed
set clipboard+=unnamedplus
set colorcolumn=81
set expandtab
set hlsearch
set ignorecase
set incsearch
set mouse=a
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
nnoremap <silent> K :call CocAction('doHover')<cr>
tnoremap <esc> <c-\><c-n>

augroup start_vim
  autocmd!
  autocmd FileType php setlocal iskeyword+=$ shiftwidth=4 tabstop=4
  autocmd BufWritePost init.vim source %
  autocmd BufEnter * :DetectIndent
augroup END

"colorscheme codedark

set background=light
colorscheme PaperColor
