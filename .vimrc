set nocompatible              " be iMproved, required
filetype off                  " required

"""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
"""""""""""""""""""""""""""""""""""""""
" taken from
"
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
 if isdirectory($HOME . '/.vim/backup') == 0
   :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
 endif
 set backupdir-=.
 set backupdir+=.
 set backupdir-=~/
 set backupdir^=~/.vim/backup/
 set backupdir^=./.vim-backup/
 set backup
" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .
 if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
 endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
 " undofile - This allows you to use undos after exiting and restarting
 " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
 " :help undo-persistence
 " This is only present in 7.3+
 if isdirectory($HOME . '/.vim/undo') == 0
  :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
 endif
 set undodir=./.vim-undo//
 set undodir+=~/.vim/undo//
 set undofile
endif

" display incomplete commands
set showcmd

let mapleader = ","

" Set encoding
set encoding=utf-8

" Status bar
set laststatus=2

" Turn mouse off
set mouse=
set mouse=""
"""""""""""""""""""""""""""""""""""""""
" VUNDLE BITS
"""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'	" Required

" Bundles here
" NERD Tree
Plugin 'scrooloose/nerdtree'

" Color / Theme plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized' " New line!!
Bundle 'tomasr/molokai'

""""""" General Programming
" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" Color coding of pairs of parenthesis, braces and brackets
Plugin 'kien/rainbow_parentheses.vim'

" Comment Toggling
Plugin 'scrooloose/nerdcommenter'

" Language specific plugins
""""""" Elixir
Plugin 'elixir-lang/vim-elixir'

""""""" JavaScript
Plugin 'claco/jasmine.vim'
Plugin 'elzr/vim-json'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'Shutnik/jshint2.vim'
Plugin 'moll/vim-node.git'

""""""" Web Development (HTML/CSS/preprocessors/etc)
Plugin 'aaronjensen/vim-sass-status'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'groenewege/vim-less'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'lukaszb/vim-web-indent'
Plugin 'othree/html5.vim'
Plugin 'tpope/vim-haml'

""""""" Rust 
Plugin 'rust-lang/rust.vim'

""""""" Python
" PyTest Support
Plugin 'alfredodeza/pytest.vim'
" JEDI, Code cmopletion for python
Plugin 'davidhalter/jedi-vim'
" PEP 8
Plugin 'nvie/vim-flake8'

" Tools
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator' 
Plugin 'mileszs/ack.vim'
Plugin 'benmills/vimux'

let g:airline_theme='luna' 
let g:airline_powerline_fonts=1

let g:markdown_fenced_languages=['ruby', 'javascript', 'elixir', 'clojure', 'sh', 'html', 'sass', 'scss', 'haml']


filetype plugin indent on    " required

" Some settings to enable the theme:
set number		" Show line numbers
set ruler
set cursorline		"highlight the current line
" set cuc cul		"highlight active column

" Show trailing whitespace and spaces before a tab:
" :highlight ExtraWhitespace ctermbg=red guibg=red
" :autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/
"
" augroup markdown
"   au!
"     au BufReadPost *.md,*.markdown setlocal tw=80
"       au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
"       augroup END

syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized
"colorscheme molokai

set noshowmode

augroup rust
  au!
  au BufNewFile,BufRead *.rs set filetype=rust
  au FileType rust noremap <buffer> <Leader>c :!cargo build<cr>
  au FileType rust noremap <buffer> <Leader>r :!cargo run<cr>
  au FileType rust noremap <buffer> <Leader>t :!cargo test<cr>
augroup END

augroup erlang
  au!
  au BufNewFile,BufRead *.erl setlocal tabstop=4
  au BufNewFile,BufRead *.erl setlocal shiftwidth=4
  au BufNewFile,BufRead *.erl setlocal softtabstop=4
  au BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

augroup elixir
  au!
  au BufNewFile,BufRead *.ex set filetype=elixir
  au BufNewFile,BufRead *.exs set filetype=elixir
  au FileType elixir noremap <buffer> <Leader>t :!mix test<cr>
  au FileType elixir noremap <buffer> <Leader>c :!mix compile<cr>
augroup END

augroup python
  au!
  au BufNewFile,BufRead *.py setlocal tabstop=4
  au BufNewFile,BufRead *.py setlocal shiftwidth=4
  au BufNewFile,BufRead *.py setlocal softtabstop=4
augroup END

augroup vimrcEx
  autocmd!
  autocmd FileType text setlocal textwidth=78

  " ftdetect isn't being pulled in from vim-elixir for some reason
  au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
  au FileType elixir setl sw=2 sts=2 et iskeyword+=!,?
augroup END

" Ack bits
map <Leader>a :Ag

" Map Ctrl+n to toggle nerd tree
map <C-n> :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""
" Enable per-project vimrcs
"""""""""""""""""""""""""""""""""""""""
set exrc   " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tab settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" size of a hard tabstop
set tabstop=2

" size of an "indent"
set shiftwidth=2

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
 set softtabstop=2

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start scrolling 3 lines before the border
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=3
xnoremap p pgvy
