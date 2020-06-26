set nocompatible
set relativenumber
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
" set backspace=indent,eol,start
syntax on
filetype off
" ------------------------------------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
 silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'vim-airline/vim-airline' 
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'sbdchd/neoformat'
Plug 'dense-analysis/ale'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'wakatime/vim-wakatime'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
call plug#end()
" ------------------------------------------------------------------------------------
if executable('rg')
  let g:rg_drive_root='true'
endif
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files -co --exclude-standard']
let mapleader = " "
" let g:netrw_browse_split = 2
let g:netrw_banner = 0
" let g:netrw_winsize = 25
let g:ctrlp_use_caching = 0
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreesShow<CR>
nnoremap <leader>pv :wincmd v<bar> :EX <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>
" ------------------------------------------------------------------------------------
" set path+=**
" set wildmenu
" set wildignore+=**/node_modules/**
" ------------------------------------------------------------------------------------
colorscheme gruvbox
set background=dark
set t_Co=256
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
let g:indentLine_enabled = 1 
" ------------------------------------------------------------------------------------
augroup suffixes
    autocmd!

    let associations = [
                \["javascript", ".js,.javascript,.es,.esx,.json"],
                \["python", ".py,.pyw"]
                \]

    for ft in associations
        execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
    endfor
augroup END
