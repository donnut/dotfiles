execute pathogen#infect()

filetype plugin indent on

"syntax on

map <silent> <Leader>tr :NERDTreeToggle<cr>
map <silent> <Leader>tf :NERDTreeFocus<cr>
map <silent> <Leader>bd :bp<bar>sp<bar>bn<bar>bd<cr>

command! FixWhitespaces %s/\s\+$//g

"nnoremap j gj
"nnoremap k gk
"vnoremap j gj
"vnoremap k gk

"noremap <Up> <nop>
"noremap <Down> <nop>
"noremap <Left> <nop>
"noremap <Right> <nop>
nnoremap <silent> <C-l> :noh<CR><C-l>
"nnoremap * *N
"nnoremap # #N
"vnoremap * *N
"vnoremap # #N
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
"nnoremap / /\v
"vnoremap / /\v
"nnoremap ? ?\v
"vnoremap ? ?\v

set mouse=nv
set hlsearch
set ignorecase
set hidden
set background=dark
set incsearch
set linebreak
set ruler
set showcmd
set noshowmode
set shiftwidth=4
set tabstop=4
set backspace=2
set autoindent
set number
set encoding=utf-8
set expandtab
set smarttab
set cmdheight=1
set laststatus=2
set cursorline
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
set noswapfile
"set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set nowrap
set foldenable
set foldnestmax=10

"colorscheme solarized
"colorscheme busybee
"colorscheme molokai
colorscheme PaperColor
highlight VertSplit guifg=#465457 guibg=#465457
highlight StatusLineNC guifg=#465457 guibg=#465457

function! CSettings()
  set noexpandtab
  set shiftwidth=4
  set tabstop=4
endfunction

au BufNewFile,BufRead *.d setf dtrace
au BufNewFile,BufRead *.agda setf agda
au BufNewFile,BufRead *.c,*.cpp call CSettings()
au InsertEnter * set nocursorline
au InsertLeave * set cursorline

au vimenter * if !argc() | NERDTree | endif
au bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

au BufReadPost fugitive://* set bufhidden=delete

let NERDTreeMinimalUI = 1

let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

let g:NERDCustomDelimiters = {
    \ 'idris': { 'left': '{-', 'right': '-}', 'leftAlt': '--' }
\}

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '>'
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0

"set balloon-eval
"autocmd FileType typescript setlocal ballonexpr=tsuquyomi#ballonexpr()
"

let g:haskell_enable_quantification = 1 " to enable highlighting of forall
let g:haskell_enable_recursivedo = 1 " to enable highlighting of mdo and rec
let g:haskell_enable_arrowsyntax = 1 " to enable highlighting of proc
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of pattern
let g:haskell_enable_typeroles = 1 " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1 " to enable highlighting of static

" set omnifunc using neco-ghc
set omnifunc=necoghc#omnifunc

"syntastic
let g:syntastic_typescript_tcs_checker = 'tsc'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"tsuquyomi
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" circumfence words
nmap <leader>q ysiw'
nmap <leader>d ysiw"

" tmux
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
