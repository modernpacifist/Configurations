set nocompatible

" ----Vundle settings----
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mg979/vim-visual-multi'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'preservim/nerdcommenter'
Plugin 'flazz/vim-colorschemes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'itchyny/vim-cursorword'
Plugin 'google/vim-searchindex'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'airblade/vim-gitgutter'
Plugin 'klen/python-mode'
Plugin 'itchyny/vim-gitbranch'
Plugin 'jremmen/vim-ripgrep'
Plugin 'fatih/vim-go'
Plugin 'bitfield/vim-gitgo'

call vundle#end()

filetype plugin indent on

syntax enable
set number
set autoread
set encoding=utf-8
set shell=fish
set wildmenu
set softtabstop=0
set shiftwidth=4
set tabstop=4
set nowrap
set smartindent
set autoindent
set expandtab
set hidden
set noignorecase
set incsearch
set showcmd
set noswapfile
set ttimeout
set ttimeoutlen=0
set completeopt+=longest,menuone,noinsert
set completeopt-=preview
set updatetime=100
set laststatus=2
set background=dark
set cursorline

set statusline+=%#LineNr#
set statusline+=\ [%{gitbranch#name()}]
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 

" Reloads buffer on its focus
autocmd FocusGained,BufEnter * :checktime
" Saves buffer on any change of data in it
autocmd FocusLost,InsertLeave,TextChanged,InsertChange * :wa
" Enable syntax for go 
autocmd BufNewFile,BufRead *.go colorscheme gitgo

" NerdCommenter settings
map <C-_> <plug>NERDCommenterToggle
let g:NERDToggleCheckAllLines = 1

let g:pymode_python = 'python3'
let g:pymode_lint_checkers = ['pep8', 'pyflakes']
let g:pymode_options_max_line_length = 110
let g:pymode_lint_on_fly = 1
let g:pymode_virtualenv = 1
let g:pymode_motion = 0
let g:pymode_rope = 0
let g:pymode_run = 0
let g:pymode_lint_ignore = "E155"

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0

let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:snips_author="modernpacifist"

colorscheme fogbell

noremap <F10> :x<CR>
noremap <F11> :xa<CR>
noremap <F12> :qa!<CR>

noremap <C-C> "+y
noremap <C-V> "+p

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

" tabs management 
nnoremap <C-I> :tabnext<CR>
nnoremap <leader><C-I> :tabprevious<CR>
nnoremap <leader>n :tabnew %<CR>
nnoremap <leader>< :-tabmove<CR>
nnoremap <leader>> :+tabmove<CR>

" disable of default shortcuts
nnoremap <S-k> <Nop>
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

augroup filetype_c
    autocmd!
    autocmd FileType c noremap <buffer> <leader>m :w<CR>:exec '!clear && make'<CR>
    autocmd FileType c set colorcolumn=100
augroup END

augroup filetype_cpp
    autocmd!
    autocmd FileType cpp noremap <buffer> <leader>m :w<CR>:exec '!clear && make'<CR>
    autocmd FileType cpp set colorcolumn=100
augroup END

augroup filetype_asm
    autocmd!
    autocmd FileType asm noremap <buffer> <leader>m :w<CR>:exec '!clear && make'<CR>
    autocmd FileType asm set colorcolumn=90
augroup END
