""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Andreas Johansson's vimrc
"
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (using Vundle)
""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle setup
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""""""""""""
""" CtrlP - Fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'

""" Fugitive - Git wrapper
Plugin 'tpope/vim-fugitive'

""" NERDTree - Filesystem tree
Plugin 'scrooloose/nerdtree'

" Git support for NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Tab support for NERDTree
Plugin 'jistr/vim-nerdtree-tabs'

""" Surround - Parentheses magic
Plugin 'tpope/vim-surround'

""" Repeat - Allow plugin mappings to be repeated
Plugin 'tpope/vim-repeat'

""" NERDCommenter - Easy commenting
Plugin 'scrooloose/nerdcommenter'

""" Syntastic - Syntax checker
Plugin 'scrooloose/syntastic'

""" UltiSnips - Snippet engine
Plugin 'SirVer/ultisnips'

" Vim-Snippets - Default snippets for UltiSnips/SnipMate
Plugin 'honza/vim-snippets'

""" Airline - Lightweight powerline
Plugin 'bling/vim-airline'

" Color themes for Airline
Plugin 'vim-airline/vim-airline-themes'

""" Tmux related plugins
" Matching powerline for Tmux
Plugin 'edkolev/tmuxline.vim'

" Seamless navigation between Vim and Tmux splits
Plugin 'christoomey/vim-tmux-navigator'

" Send code blocks to be executed other Tmux windows
Plugin 'jgdavey/tslime.vim'

""" SimplyFold - Better code folding
Plugin 'tmhedberg/SimpylFold'

""" Color schemes
" Solarized
Plugin 'altercation/vim-colors-solarized'

""" Python related plugins
" Check PEP8 formatting
Plugin 'nvie/vim-flake8'

" Proper auto-indendtation for Python
Plugin 'vim-scripts/indentpython.vim'


""""""""""""""""""""""""""""""
" All plugins must be added before the following line
call vundle#end()
filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""
" General settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable UTF-8 encoding
set encoding=utf-8

" Keep a backup file
set backup

" Always show cursor position
set ruler

" Number of command lines kept in history
set history=50

" Display incomplete commands
set showcmd

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Enable mouse support if available
if has('mouse')
	set mouse=a
endif

" Search options
set incsearch
set ignorecase
set smartcase

" Set relative line numbering and absolute line number at current line
set relativenumber
set number

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
	\if line("'\"") > 1 && line("'\"") <= line("$") |
	\ exe

""""""""""""""""""""""""""""""""""""""""""""""""""
" General key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Use 'jj' as Esc in insert and visual mode
inoremap jj <Esc>
"vnoremap jj <Esc>

" Increase document scroll speed
nnoremap <C-E> 3<C-E>
nnoremap <C-Y> 3<C-Y>

" Insert blank lines
nnoremap <Enter> o<Esc>
"nnoremap <S-Enter> <S-O><Esc>

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Disable arrow keys for training purposes
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Color settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Tell vim that gnome-terminal has 256 colors
"if $COLORTERM == 'gnome-terminal'
"set t_Co=256
"endif

" Enable syntax highlighting
syntax enable

" Highlight last search pattern
set hlsearch

" Color scheme
set background=dark

" If the terminal emulator does not have the custom solarized palette
" use degraded 256 colorscheme. Must be before 'colorscheme sol...'
"let g:solarized_termcolors=256

colorscheme solarized

" Always highlight the 80th column
set colorcolumn=80

""""""""""""""""""""""""""""""""""""""""""""""""""
" Window navigation
""""""""""""""""""""""""""""""""""""""""""""""""""
" Set split directions
set splitbelow
set splitright

" Easier split navigation (can be made consistent with Tmux)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""
" Use both 'indent' and 'manual' foldmethod
au BufReadPre * setlocal foldmethod=indent
au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif

set foldlevel=99

" Enable toggle folding with spacebar
"nnoremap <space> za

" Show docstrings of folded code (SimplyFold plugin)
let g:SimplyFold_docstring_preview=1

" Automatically save and load view
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview


""""""""""""""""""""""""""""""""""""""""""""""""""
" Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""
" Always set auto-indentation on
set autoindent

" General indentation settings
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Wrap text at 79 characters by default
set textwidth=79


""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcut
noremap <F9> :NERDTreeTabsToggle<CR>

" Auto open (if no file is specified)
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Auto close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDTree git plugin settings
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ "Unknown"   : "?"
	\ }

" Ignore backup files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Change key binding to launch
let g:ctrlp_map = '<leader>p'


""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippets
""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips trigger config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Let :UltiSnipsEdit split the window
let g:UltiSnipsEditSplit="vertical"


""""""""""""""""""""""""""""""""""""""""""""""""""
" Flake8 settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap <F7> to <F8>
autocmd FileType python map <buffer> <F8> :call Flake8()<CR>

" Auto-run Flake8 on write file
autocmd BufWritePost *.py call Flake8()


""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

" Automatically display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1"


""""""""""""""""""""""""""""""""""""""""""""""""""
" Tslime plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""
" Tslime should use current session and window
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" Keybindings
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars


""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""
" I can't be bothered anymore... *mumbles about stupid shift keys*
:command W w
:command Q q
:command Wq wq
:command WQ wq

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis \ | wincmd p | diffthis
endif
