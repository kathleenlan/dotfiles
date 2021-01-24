" System
set shell=/bin/bash
set clipboard=unnamed
set nocompatible
filetype off

set ruler
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/bin/fzf

call vundle#begin()

" Github Bundles
Plugin 'danro/rename.vim'
Plugin 'docunext/closetag.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'kana/vim-fakeclip'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'raimondi/delimitMate'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'shougo/neocomplete.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
"Plugin 'tpope/vim-rails.git'
"Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/DeleteTrailingWhitespace'
Plugin 'vim-scripts/ShowTrailingWhitespace'
Plugin 'vim-scripts/supertab'
Plugin 'vim-syntastic/syntastic'
Plugin 'fatih/vim-go'
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()

" Turn on omni completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Search (using ripgrep)
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Indent Guides configuration
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" Trailing Whitespace configuration
let g:DeleteTrailingWhitespace = 1
let g:DeleteTrailingWhitespace_Action = 'delete'

" Nerdtree configuration
let NERDTreeShowHidden=1
let g:NERDTreeWinSize = 50

" Syntastic configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_ruby_exec = '~/.rbenv/shims/ruby'

" vim-go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" ALE
let g:ale_fix_on_save = 1
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" Syntax Highlighting
set t_Co=256
syntax enable

" Visual guide
set colorcolumn=80

" colorscheme
set background=dark
colorscheme solarized

" Spacing and Wrapping
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smarttab

" Interface
set showcmd

" Editing
set smartindent
set showmode
set showmatch
set list listchars=tab:>>,eol:¬,trail:·
set rnu
set number
set backspace=indent,eol,start
set cursorline
set cursorcolumn

" Multipurpose Tab Key
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Searching
set incsearch
set hlsearch
set ignorecase smartcase

" File Storage
set autoread
set noswapfile
set nobackup
set nowritebackup

" Undo
"
set undofile
set undodir=~/.vim/undo

" Leader
let mapleader = ','
map <leader>n :NERDTreeToggle<CR>
map <leader>b :CtrlPBuffer<CR>

" move around with the arrow keys
noremap <silent> <Right> <c-w>l
noremap <silent> <Left> <c-w>h
noremap <silent> <Up> <c-w>k
noremap <silent> <Down> <c-w>j

" set visualbell and reset terminal code for visual bell to disable flash and
" beep when something is wrong. Thanks, Yiwen!
set visualbell
set t_vb=

" Command
map <leader><leader> :
" Config
map <leader>c :e ~/.vimrc<CR>
" Reload Config
map <leader>R :so ~/.vimrc<CR>
" Reload Tags
map <leader>T :!/usr/local/bin/ctags -R --exclude=.git --exclude=log *<CR><CR>
" Run
map <leader>r :!source %<CR>
" Run Rspec
map <leader>t :!rspec %<CR>
" Rails Bundle
map <leader>rbi :!bundle<CR>
" VIM Bundle
map <leader>B :BundleInstall<CR>q

map <leader>f :FZF<CR>

" vim-go jump to definition
map <leader>g :GoDef<CR>

cnoreabbrev Ack Ack!
nnoremap <leader>a :Ack!<Space>
