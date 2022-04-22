" XIAN VIM CONFIG

" Autoinstall Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"General
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
"C#
Plug 'OmniSharp/omnisharp-vim'
" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" Vim Options
	
" Syntax on with theme colors
syntax enable
" No Warning Bells
set noerrorbells
" Sets the tabstop to 4
set tabstop=4 softtabstop=4
" Sets the shifting to 4
set shiftwidth=4
" Converst from tab to spaces
set expandtab
" Autoindent
set autoindent
" The number of screenlines above and below cursor
set scrolloff=1
" Line Numbers
set number
" No swap files
set noswapfile
" No Backup
set nobackup
" Sets where the undo directory resides
set undodir=~/.vim/undodir
" Uses undofile instead of backups
set undofile
" Set colorscheme
colorscheme nord
" Incremental Search
set incsearch
" Set term size
set termwinsize=10x0
	
" Keybinds
	
" Scrolloff toggle with \zz
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>
" Split movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Nerd Tree Toggle
nnoremap <C-t> :NERDTreeToggle<CR>
" Goto definitions for different file types.
autocmd FileType cs nmap <silent> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>

" Stuff
    
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
\ quit | endif
" Open term below all splits
cabbrev bterm bo term
" How tab behaves while picking auto complete 
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"
" How tab completion behaves woth OmniSharp
autocmd FileType cs let g:SuperTabDefaultCompletionType = 'context'
autocmd FileType cs let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
autocmd FileType cs let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]    
