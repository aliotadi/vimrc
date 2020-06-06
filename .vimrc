" Basic setup: 

" enter current millenum
set nocompatible
set number
set relativenumber
" enable systax and plugin (for netrw)
syntax enable
filetype off

let mapleader = ","

" ------------------------------------------------------------------------------------


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ------------------------------------------------------------------------------------

Plugin 'Yggdroot/indentLine'

" ------------------------------------------------------------------------------------

Plugin 'wakatime/vim-wakatime'

" ------------------------------------------------------------------------------------

Plugin 'mhartington/oceanic-next'

" ------------------------------------------------------------------------------------

Plugin 'vim-airline/vim-airline' 

" ------------------------------------------------------------------------------------

Plugin 'vim-prettier'

" ------------------------------------------------------------------------------------

Plugin 'sbdchd/neoformat'

" ------------------------------------------------------------------------------------

Plugin 'dense-analysis/ale'

" ------------------------------------------------------------------------------------

Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'yuezk/vim-js'
Plugin 'HerringtonDarkholme/yats.vim'

" ------------------------------------------------------------------------------------

Plugin 'ludovicchabant/vim-gutentags'

" ------------------------------------------------------------------------------------

" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ------------------------------------------------------------------------------------

" and this is vim.plug // i'm adding this to install vim js file import

if empty(glob('~/.vim/autoload/plug.vim'))
 silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'

call plug#end()
" ------------------------------------------------------------------------------------

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
set wildignore+=**/node_modules/**

" HOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" TAG JUMPING:


" ------------------------------------------------------------------------------------


" Create the `tags` file (may need to isntall ctag first)
command! MakeTags !ctags -R .

" HOW WE CAN:
" - Use ^] to jump to tag under the cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back to up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


" ------------------------------------------------------------------------------------


" AUTOCOMPLETE:
" - The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST in this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n   for anythign specified by the 'complete' option

" HOW WE CAN:
" - use ^n and ^p to go back and froth in the suggestion list


" ------------------------------------------------------------------------------------


" FILE BROWSING:

" tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings
" ------------------------------------------------------------------------------------

set t_Co=256
colorscheme OceanicNext
let g:airline_theme='oceanicnext'


" ------------------------------------------------------------------------------------

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


" ------------------------------------------------------------------------------------

let g:prettier#autoformat_config_present = 1 
autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.jsx Neoformat
autocmd BufWritePre *.html Neoformat
autocmd BufWritePre *.json Neoformat

" ------------------------------------------------------------------------------------

let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
let g:ale_fix_on_save = 1


" ------------------------------------------------------------------------------------

" disable arrow keys :))
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>

nnoremap <Right> :echo "No Right for you!"<CR> vnoremap <Right> :<C-u>echo "No Right for you!"<CR>
inoremap <Right> <C-o>:echo "No Right for you!"<CR>

nnoremap <UP> :echo "No Up for you!"<CR>
vnoremap <UP> :<C-u>echo "No Up for you!"<CR>
inoremap <UP> <C-o>:echo "No Up for you!"<CR>

nnoremap <Down> :echo "No Down for you!"<CR>
vnoremap <Down> :<C-u>echo "No Down for you!"<CR>
inoremap <Down> <C-o>:echo "No Down for you!"<CR>

" ------------------------------------------------------------------------------------
let g:indentLine_enabled = 1 

" ------------------------------------------------------------------------------------
"
"  autocomplete things mapping :))
"
"inoremap { {}<Esc>i
"inoremap ( ()<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i
"inoremap [ []<Esc>i
"
"
