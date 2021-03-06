set nocompatible              " be iMproved, required            
filetype off                  " required                 
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim               
call vundle#begin()
"
" let Vundle manage Vundle, required'
Plugin 'VundleVim/Vundle.vim'

" best autocomplete plugin
Plugin 'Valloric/YouCompleteMe'

" nice redo-unredo tool
Plugin 'mbbill/undotree'
"
" Keep Plugin commands between vundle#begin/end.
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :ER_HOME/.vimrc
" :PluginSearch foo - searches for foo; append `!` to refresh local cavimrc
" :PluginClean      - confirms removal of unused plugins; append `!` tal' >> $USER_HOME/.vimrc
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" javascript syntax
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
