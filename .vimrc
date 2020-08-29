"jcustom settings
set pyx=3
set wrap linebreak
set wildmenu
set incsearch
set clipboard=unnamedplus
syntax on
set guicursor=
let g:python_highlight_all = 1
set laststatus=2
set noshowmode
set noswapfile
set nobackup
set noerrorbells
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4 softtabstop=4
set smartindent
set undodir=~/.vim/undodir
set termguicolors
set undofile
set scrolloff=8
set splitbelow splitright
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

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" swaps between buffers
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h
nnoremap <leader>bn :w <CR>:bnext<CR>
nnoremap <leader>bv :w <CR>:bprev<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>ba :bufdo bd<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-H> :vertical resize +3<CR>
noremap <silent> <C-L> :vertical resize -3<CR>
noremap <silent> <C-K> :resize +3<CR>
noremap <silent> <C-J> :resize -3<CR>
noremap <leader>v :vsp<CR>
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

" Removes pipes | that act as seperators on splits
set fillchars+=vert:\

" mapping
let mapleader = ' '
map <Leader>w :w<CR>
if has('nvim')
    map <Leader>r :source ~/.config/nvim/init.vim<CR>
    map <Leader>R :e ~/.config/nvim/init.vim<CR>
else
    map <Leader>r :source ~/.vimrc<CR>
    map <Leader>R :e ~/.vimrc<CR>
endif

" plugins
call plug#begin('~/Documents/vimrc/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'jremmen/vim-ripgrep'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'easymotion/vim-easymotion'
call plug#end()

" colors
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

" NERDTree
map <C-\> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'

" fzf
nmap <C-p> :GFiles<CR>
nmap <Leader>n :Buffers<CR>

" undotree
nmap <Leader>u :UndotreeShow<CR>

" vim-sessions
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_autosave_periodic = 1
let g:session_autosave_silent = 1
let g:session_command_alias = 1

" --- vim go (polyglot) settings.
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

" ripgrep
if executable('rg')
    let g:rg_derive_root='true'
endif
nnoremap <leader>f :Rg 
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>

" netrw
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

" vim-airline
let g:airline#extensions#tabline#enabled = 1 " Automatically displays all buffers when there's only one tab open.
let g:airline_theme='badwolf'

" vim-fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :G commit -m
nmap <leader>gu :G push<CR> 

" vim-easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

""""""""""""""" coc.vim """""""""""""""""""" 
" " Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
