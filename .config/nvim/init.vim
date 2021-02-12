if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'Lokaltog/vim-monotone'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'StanAngeloff/php.vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'ap/vim-css-color'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ciaranm/detectindent'
  Plug 'dense-analysis/ale'
  Plug 'digitaltoad/vim-pug'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'hashivim/vim-terraform'
  Plug 'jremmen/vim-ripgrep'
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'kamykn/spelunker.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'moby/moby', {'rtp': '/contrib/syntax/vim/'}
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pangloss/vim-javascript'
  Plug 'scrooloose/nerdcommenter'
  Plug 'scrooloose/nerdtree'
  Plug 'shime/vim-livedown'
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sleuth'
  Plug 'tveskag/nvim-blame-line'
  Plug 'vim-scripts/vim-auto-save'
call plug#end()

let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {'javascript':['eslint'], 'typescript':['eslint']}
let g:ale_php_phpstan_level = 'max'
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:javascript_plugin_jsdoc = 1
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
set smartindent
set spelllang=en_gb
set synmaxcol=200
set tabstop=2
set wildmode=longest,list,full

nnoremap <c-n> :NERDTreeToggle<cr>
nnoremap <c-p> :GFiles<cr>
nnoremap <silent> K :call CocAction('doHover')<cr>
nnoremap p p`]<Esc>
tnoremap <esc> <c-\><c-n>

let s:coc_extensions = [
  \'coc-css',
  \'coc-docker',
  \'coc-eslint',
  \'coc-html',
  \'coc-json',
  \'coc-phpls',
  \'coc-sql',
  \'coc-tsserver',
  \'coc-yaml',
\]

for extension in s:coc_extensions
  call coc#add_extension(extension)
endfor

colorscheme PaperColor
