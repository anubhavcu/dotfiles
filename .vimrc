let g:ale_fix_on_save = 1
"----------
" Basic editing config
" ---------
" showcmd is for showing commands while typing in insert mode"
set nocompatible              " be iMproved, required
set showcmd
filetype off                  " required
filetype indent plugin on
set modeline
set laststatus=2
" set formatoptions-=ro      " preventing default behaviour of autoformat when moving from a already commented line to a new line using o/O. in autoformat vim adds a comment character at the begining of each new line you enter after a comment, this turns it off.
" above option not working, try au FileType * set fo-=c fo-=r fo-=o
" au FileType * set fo-=c fo-=r fo-=o   " this line has moved to end of file (not working due to some plugin conflict)
" Turn on syntax highlighting.
syntax on
let python_highlight_all=1
syntax enable
" Disable the default Vim startup message.
set shortmess+=I
" Show line numbers.
set number
" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber
" Always show the status line at the bottom, even if you only have one window open.
set tabstop=8   " default tab space is 8
set shiftwidth=4    " autoindentation
set expandtab       " converts tabs into spaces
" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden
" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase
" Enable searching as you type, rather than waiting till you press enter.
set incsearch
set hls " highlight search
" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=
" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a
" just for opening a new window split down /right
set splitbelow
set splitright
let mapleader = " "     " maps leader key to space (\ was default)
" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
" below four remaps are for switching between split windows
" instead of pressing <C-w> and then direction , we can simply switch tabs
" with ctrl-h/j/k/l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>








" -----------------------
"
"
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" Plugin 'tpope/vim-surround'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"  Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}


Plugin 'dense-analysis/ale'       " syntax checking plugin, this plugin runs asynchronously while typing, we have syntastic also which cheks error on file save(syntastic was installed by pathogen)

Plugin 'jeetsukumaran/vim-buffergator'  " plugin to navigate between buffers

Plugin 'Chiel92/vim-autoformat'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1  " ensures closing the autocomplete preview window
map <leader>g   :YcmCompleter GoToDefinitionElseDeclaration<CR>
" above line maps leader-g key to go to any function definition when the
" cursor is on function calling
autocmd vimenter * colorscheme gruvbox
set background=dark
Plugin 'morhetz/gruvbox'   "gruvbox theme

Plugin 'tpope/vim-commentary'  " comments out with gcc toggle
autocmd FileType apache setlocal commentstring=#\ %s    " this line for various language support(js, python ..)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"

" pathogen
execute pathogen#infect()

" nerdtree remap
nnoremap <Leader>n : NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
" autocmd vimenter * NERDTree     " opens nerdtree automatically when vim startsup
" let NERDTreeShowHidden=1    " allow nerdTree to show hidden files by default

" ctrlp.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim

"change mapping to invoke ctrlP in normal mode
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"searching by filename as opposed to full path (set to 0 to put it in
"default,)
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'"


" buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap <Leader>b :BuffergatorToggle<CR>


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%{ObsessionStatus()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ------------ale
let g:ale_linters = {'python' : ['flake8', 'pydocstyle', 'bandit', 'mypy', 'autopep8']}
" let g:ale_fixers = {'*': [], 'python':['black', 'isort']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace', 'add_blank_lines_for_python_control_statements', 'reorder-python-imports'], 'python': ['black', 'isort', 'autopep8', 'yapf']}
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

" Keep the sign gutter open at all times
let g:ale_sign_column_always = 1
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1



" below 2 lines are mappings for resizing window size --- not working
" currently
" nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
"
au FileType * set fo-=c fo-=r fo-=o     " this line for avoiding comment character when moving to new line with o/O


" below mapping runs python code in current buffer

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" vim-autoformat (plugin Chiel91)

au BufWrite * :Autoformat       " auto-format file on save
noremap <F3> :Autoformat<CR>
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0
