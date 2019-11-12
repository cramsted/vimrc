" automatic setup for plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'atom/fuzzy-finder'
  Plug 'xolox/vim-session'
  Plug 'wellle/targets.vim'
  Plug 'xolox/vim-misc'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-surround'
call plug#end()

" keyboard shortcuts
let mapleader = ','
map <C-\> :NERDTreeToggle<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>t :BTags<CR>
nmap <Leader>T :Tags<CR>
nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>/ :Rg<Space>
nmap <Leader>H :Helptags!<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>M :Maps<CR>
nmap <Leader>s :Filetypes<CR>
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" settings
set number
set mouse=a
set relativenumber
let g:session_autosave= 'yes'
let g:session_autoload= 'no'
let g:session_autosave_periodic= 1
let g:session_autosave_silent= 1
let g:session_default_to_last= 1
colorscheme challenger_deep 

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" swaps between buffers
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

" regenerates ctags on a write
nnoremap <Leader>w :update<Bar>if filereadable('.ctags')<Bar>execute '!ctags --options=.ctags . &'<Bar>endif<CR>

" tag searching
nnoremap <Leader>r :CtrlPTag<CR>

" open shell
nnoremap <Leader>s :sh<CR>

" resource .vimrc
nnoremap <Leader>p :source ~/.vimrc<CR>

" ---- Minimal configuration:
set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=4  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> character

" ---- Good to have for consistency
set tabstop=4   " Number of spaces that a <Tab> in the file counts for
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth

" ---- Bonus for proving the setting
" Displays '-' for trailing space, '>-' for tabs and '_' for non breakable space
set listchars=tab:>-,trail:-,nbsp:_
set list
