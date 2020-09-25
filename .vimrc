" custom settings
set nocompatible " keeps errors from being thrown when -u is used
set rtp+=~/.fzf
let mapleader = ' '
set pyx=3
set relativenumber
set number
set wrap linebreak
set wildmenu
set incsearch
set clipboard=unnamedplus
set backspace=indent,eol,start
syntax on
set guicursor=
let g:python_highlight_all = 1
set laststatus=2
set noshowmode
set mouse=a
set noswapfile
set nobackup
set noerrorbells
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2 softtabstop=2
set smartindent
set undodir=~/.vim/undodir
set termguicolors
set undofile
set scrolloff=8
set splitbelow splitright
set hlsearch
set spell

" Displays '-' for trailing space, '>-' for tabs and '_' for non breakable space
set listchars=tab:>-,trail:-,nbsp:_
set list


" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" swaps between buffers
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
nnoremap <leader>nb :w <CR>:bnext<CR>
nnoremap <leader>vb :w <CR>:bprev<CR>
nnoremap <leader>b :w <CR>:Buffers<CR> 

nnoremap <leader>db :bdelete 
nnoremap <leader>dab :bufdo bd<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-H> :vertical resize +3<CR>
noremap <silent> <C-L> :vertical resize -3<CR>
noremap <silent> <C-K> :resize +3<CR>
noremap <silent> <C-J> :resize -3<CR>
noremap <leader>v :vsp<CR>
noremap <leader>V :sp<CR>
" auto closing
inoremap (; (<CR>);<C-c>O
inoremap (, (<CR>),<C-c>O
inoremap {; {<CR>};<C-c>O
inoremap {, {<CR>},<C-c>O
inoremap [; [<CR>];<C-c>O
inoremap [, [<CR>],<C-c>O
" autosave wheen focus is lost
:au FocusLost * :wa

nmap <leader>e :w<CR>:Ex<CR>                                                    
nmap <leader>a ggVG
nmap <leader>gt :!./notes-commit.sh<CR>

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\

" mapping
map <Leader>w :w<CR>
if has('nvim')
    map <Leader>r :source ~/.config/nvim/init.vim<CR>
    map <Leader>R :e ~/.config/nvim/init.vim<CR>
else
    map <Leader>r :source ~/.vimrc<CR>
    map <Leader>R :e ~/.vimrc<CR>
endif

" swapping between .h and .cpp files in c/c++
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" search visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" find and replace all matching instances of selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'easymotion/vim-easymotion'
call plug#end()

" colors
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'soft'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
" set after the color scheme to stop conflicts
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey30

" fzf
nmap <C-p> :Files<CR>
"nmap <Leader>b :Buffers<CR>
"
"" undotree
"nmap <Leader>u :UndotreeShow<CR>
"
"" vim-sessions
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1
let g:session_command_alias = 1
nmap <leader>os :OpenSession 
"
"" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
"
"" ripgrep
"if executable('rg')
"    let g:rg_derive_root='true'
"endif
"nnoremap <leader>f :Rg 
"nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
"
"" netrw
let g:netrw_browse_split = 0
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
"
"" vim-airline
let g:airline#extensions#tabline#enabled = 1 " Automatically displays all buffers when there's only one tab open. */
let g:airline_theme='badwolf' 
"
"" vim-fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :G commit -m
nmap <leader>gu :G push<CR> 

" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" indentLine
let g:indentLine_setColors = 0

"""""""""""""""" coc.vim """""""""""""""""""" 
"" " Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.

let g:coc_global_extensions = [ 'coc-json', 'coc-clangd', 'coc-cmake', 'coc-fzf-preview', 'coc-git', 'coc-python', 'coc-sh', 'coc-spell-checker', 'coc-xml', 'coc-yaml', 'coc-sql', 'coc-markdownlint' ]
let g:coc_disable_startup_warning = 1
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"   

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>i  <Plug>(coc-format-selected)
nmap <leader>i  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
