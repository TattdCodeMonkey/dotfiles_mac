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
"""""""""""""""""""""""""""""""""""""""
" VUNDLE BITS
"""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'	" Required

" Bundles here
" Color / Theme plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized' " New line!!
Bundle 'tomasr/molokai'

" Language specific plugins
Plugin 'elixir-lang/vim-elixir'

" Tools
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator' 
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-markdown' 
Plugin 'jtratner/vim-flavored-markdown'

Bundle 'jplaut/vim-arduino-ino'

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

augroup erlang
  au!
  au BufNewFile,BufRead *.erl setlocal tabstop=4
  au BufNewFile,BufRead *.erl setlocal shiftwidth=4
  au BufNewFile,BufRead *.erl setlocal softtabstop=4
  au BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

augroup elixir
  au!
  au FileType elixir noremap <buffer> <Leader>t :!mix test<cr>
augroup END

augroup arduino
  au BufRead,BufNewFile *.pde set filetype=arduino
  au BufRead,BufNewFile *.ino set filetype=arduino
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

"""""""""""""""""""""""""""""""""""""""
" Enable per-project vimrcs
"""""""""""""""""""""""""""""""""""""""
set exrc   " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc files

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start scrolling 3 lines before the border
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=3
xnoremap p pgvy
