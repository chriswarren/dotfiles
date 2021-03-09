execute pathogen#infect()

syntax enable

filetype plugin indent on

" Add comma as leader
:nmap , \

" Add esc shortcut
:imap jj <Esc>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" vim tab navigation
nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap tc :tabclose<CR>
nnoremap tn :tabnew<CR>

" disable arrow navigation keys
inoremap  <Up>    <NOP>
inoremap  <Down>  <NOP>
inoremap  <Left>  <NOP>
inoremap  <Right> <NOP>
noremap   <Up>    <NOP>
noremap   <Down>  <NOP>
noremap   <Left>  <NOP>
noremap   <Right> <NOP>

" show line numbers
set number

" set a column at 100 chars
set colorcolumn=100

" set tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab

" set focus to 'new' panes
set splitright
set splitbelow

" Save with leader + w
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>

" Split panes with leader and  opens Ctrl + P
map <Leader>vv :vsp<cr><C-p>
map <Leader>ss :sp<cr><C-p>

" Unhighlight search results
map <Leader><space> :nohl<cr>

" Disable swapfile
set noswapfile

" airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" ctrlp.vim config
if get(g:, 'loaded_ctrlp', 1)
  let g:ctrlp_match_window_reversed = 0
  let g:ctrlp_working_path_mode = 'a'
  let g:ctrlp_max_height = 20
  let g:ctrlp_match_window_bottom = 0
  let g:ctrlp_switch_buffer = 0
  let g:ctrlp_custom_ignore = '\v.DS_Store|.sass-cache|.scssc|tmp|.bundle|.git|node_modules|vendor|bower_components$|_build$|deps'
endif

" The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  " This uses Ack.vim to search for the word under the cursor
  nnoremap <leader><bs> :Ack! <c-r><c-w><cr>
endif

" highlight search matches
set hlsearch

" format JSON with python
nnoremap <Leader>j :%!python -m json.tool<cr>

colorscheme dichromatic
