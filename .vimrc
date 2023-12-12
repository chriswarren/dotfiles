syntax enable

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

filetype plugin indent on

" plugins
call plug#begin()
  " Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  " Plug 'kien/ctrlp.vim' "fuzzy file finder
  Plug 'jremmen/vim-ripgrep' "Search with RipGrep
  Plug 'JamshedVesuna/vim-markdown-preview' "Markdown Preview
  Plug 'edkolev/tmuxline.vim' "idk -
  Plug 'vim-airline/vim-airline' "useful information like powerline
  Plug 'christoomey/vim-tmux-navigator' "navigate vim splits and tmux panes with ease
  Plug 'ryanoasis/vim-devicons' "filetype glyphs
  Plug 'rondale-sc/vim-spacejam' "remove trailing whitespace
  Plug 'tpope/vim-commentary' "comment stuff out
  Plug 'tpope/vim-rails' "rails tools
  Plug 'tpope/vim-surround' "quoting/parenthesizing
  Plug 'tpope/vim-fugitive' "git tooling
  Plug 'tpope/vim-rhubarb' "git browse
  Plug 'tpope/vim-endwise' "wisely add `end`
  Plug 'vim-ruby/vim-ruby' "ruby tooling
  Plug 'scrooloose/nerdtree' "File Tree
  Plug 'tpope/vim-unimpaired' "set paste, etc.
  Plug 'vim-syntastic/syntastic' "Syntax checking
  Plug 'iberianpig/tig-explorer.vim' "tig explorer
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mileszs/ack.vim'
  Plug 'pechorin/any-jump.vim'
  Plug 'nvim-lua/plenary.nvim' "telescope dep
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "telescope dep
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' } " file finding
call plug#end()

" Theme
if (has("termguicolors"))
  set termguicolors
endif
syntax enable
colorscheme tokyonight

" Set leader
let mapleader=","
let maplocalleader=","

syntax on                        " enable syntax highlighting
set cursorline                   " Highlight current line
set wrap                         " wrap long lines
set showcmd                      " show commands as we type them
set showmatch                    " highlight matching brackets
set scrolloff=4 sidescrolloff=10 " scroll the window when we get near the edge
set incsearch                    " show the first match as search strings are typed
set hlsearch                     " highlight the search matches
set ignorecase smartcase         " searching is case insensitive when all lowercase
set gdefault                     " assume the /g flag on substitutions to replace all matches in a line
set autoread                     " pick up external file modifications
set hidden                       " don't abandon buffers when unloading
set autoindent                   " match indentation of previous line
set laststatus=2                 " show status line
set display=lastline             " When lines are cropped at the screen bottom, show as much as possible
set backspace=indent,eol,start   " make backspace work in insert mode
set clipboard^=unnamed           " Use system clipboard
set shell=zsh                    " Use login shell for commands
set encoding=utf-8               " utf encoding
set number                       " line numbers
set nobackup                     " no backups
set nowritebackup                " no backups
set noswapfile                   " no swap file
set colorcolumn=80               " set a column at 80 chars

" match tabs/spaces
set smarttab
set smartindent
set expandtab tabstop=2 softtabstop=2 shiftwidth=2

" set focus to 'new' panes
set splitright
set splitbelow

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

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

" show relative line numbers
set relativenumber

" buffer resizing mappings
nnoremap <S-H> :vertical resize -10<cr>
nnoremap <S-L> :vertical resize +10<cr>

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

" ctrlp
 if get(g:, 'loaded_ctrlp', 1)
   let g:ctrlp_match_window_reversed = 0
   " let g:ctrlp_working_path_mode = 'a'
   let g:ctrlp_max_height = 20
   let g:ctrlp_match_window_bottom = 0
   let g:ctrlp_switch_buffer = 0
   let g:ctrlp_custom_ignore = '\v(\.DS_Store|\.sass-cache|\.scssc|tmp|\.bundle|\.git|node_modules|vendor|bower_components|deps|_build)$'
   let g:ctrlp_working_path_mode = 'w'
   if executable('ag')
      let g:ctrlp_user_command = 'ag %s
             \ -l
             \ --nocolor
             \ --ignore .git
             \ --ignore .svn
             \ --ignore "*.class"
             \ --ignore "*.o"
             \ --ignore "*.obj"
             \ --ignore "*.rbc"
             \ --ignore features/cassettes
             \ --ignore spec/cassettes
             \ --ignore tmp/cache
             \ --ignore vendor/gems
             \ --ignore vendor/ruby
             \ -g ""'
   endif
 endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" AnyJump

let g:any_jump_disable_default_keybindings = 1
" Use AnyJump to search for the word under the cursor
nnoremap <leader><bs> :AnyJump <cr>

" ack.vim --- {{{
" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
" let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

" use <tab> for trigger completion and navigate to the next complete item
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" highlight search matches
set hlsearch

" format JSON with python
nnoremap <Leader>j :%!python -m json.tool<cr>
