" XIAN VIM CONFIG

" Autoinstall Vim Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Command must be before plugs
call plug#begin()

" Plugins
	
	"NERDTree
	Plug 'scrooloose/nerdtree'

	"Vim Airline
	Plug 'vim-airline/vim-airline'

	"Vim Airline Themes
	Plug 'vim-airline/vim-airline-themes'
	
	"Nord Theme
	Plug 'arcticicestudio/nord-vim'
	

" Command must be below plugs
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
	"set expandtab
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
	" Makes the background dark
	"set background=dark
	" Incremental Search
	set incsearch

" Plug Settings

	" NERDTree
		" Toggle Hotkey
		nnoremap <C-t> :NERDTreeToggle<CR>
		" Exit Vim if NERDTree is the only window left.
		autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
		
