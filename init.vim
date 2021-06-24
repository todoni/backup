"Seul neovim setting

"================================= General Config ===================================

filetype plugin on

let g:mapleader = ","

let g:onedark_terminal_italics = 1

set number                      "line numbers
set history=1000                "store :cmd history
set hlsearch                    "highlight searching result
set ignorecase                  "ignore Case sensitive when searching
set showmatch                   "highlight matched bracket ()
set wrap

"================================= Optional setting =================================
set relativenumber              "show relative number from current line
set title                       "change the terminal title
set cursorline                  "highlight cursor line
set mouse=h                     "Enable mouse in help mode
                                "'a' to all mode, n, v, i, c to Normal, Visual, Insert, Command mode
syntax sync minlines=200        "speed-up vim
set clipboard=unnamed           "yank, paste to system clipboard

"================================= Turn of swap =====================================
set noswapfile
set nobackup
set nowritebackup

"================================= Indentation ======================================
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

"================================= Tap & Space ======================================
nmap <leader>l :set list!<CR>
highlight SpecialKey cterm=None ctermfg=grey
map <leader>2 :retab<CR>:set ts=4<CR>:set noexpandtab<CR>:retab!<CR>:set expandtab<CR>:set ts=2<CR>:set sw=2<CR>:retab!<CR>
map <leader>4 :retab<CR>:set ts=2<CR>:set noexpandtab<CR>:retab!<CR>:set expandtab<CR>:set ts=4<CR>:set sw=4<CR>:retab!<CR>
set listchars=tab:>·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:·
set listchars+=space:·
" set listchars=tab:>·
" set listchars+=trail:·          "show for tab, trail char at the end of the line
" set listchars+=extends:»
" set listchars+=precedes:«
set fillchars+=vert:\│          "Make vertical split separator full line

" ================================ Persistent Undo ===================================
" Keep undo history across sessions, by storing in file.
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" ================================ Ctags settings ===================================
set tags=./tags;                "find tags in current dir
" Set Ctrl + [ to previous
nnoremap <C-[> :po<CR>
nnoremap <leader>. :CtrlPTag<cr>


" ================================ Auto command ===================================

autocmd InsertEnter * :set nocul                  "Remove cursorline highlight
autocmd InsertLeave * :set cul                    "Add cursorline highlight in normal mode
autocmd FileType html setlocal sw=2 ts=2 "Set indentation to 4 for html, css, scss, js
autocmd FileType css setlocal sw=2 ts=2
autocmd FileType scss setlocal sw=2 ts=2
autocmd FileType js setlocal sw=2 ts=2
autocmd FileType yml setlocal sw=2 ts=2

"================================= Plugins ========================================
call plug#begin('~/.vim/plugged')
if has('nvim')
    Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'w0rp/ale'

Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'wakatime/vim-wakatime'            "check coding time
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'          "Toggle nerd tree with one key
Plug 'mattn/emmet-vim'                  "Trigger: <C-y><leader>
Plug 'tpope/vim-commentary'             "Trigger: gc
Plug 'jiangmiao/auto-pairs'             "Auto pair for ',), }, ]...
Plug 'airblade/vim-gitgutter'           "Show git status in vim
Plug 'tpope/vim-fugitive'               "Git warpper
Plug 'ctrlpvim/ctrlp.vim'               "Ctrl + P for search file
" Plug '~/.fzf'                           "https://github.com/junegunn/fzf.vim
" Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'               "fancy start page for empty vim
Plug 'posva/vim-vue'
Plug 'iCyMind/NeoSolarized'
Plug 'tmhedberg/matchit'                "extended % matching
Plug 'kshenoy/vim-signature'            "Showing mark in vim
Plug 'wakatime/vim-wakatime'            "Mesure coding time
Plug 'rizzatti/dash.vim'                "Integration with dash
Plug 'tomlion/vim-solidity'             "vim solidity syntax
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
"----- themes ---------
Plug 'sainnhe/everforest'               "짙은청록
Plug 'sainnhe/sonokai'
Plug 'sts10/vim-pink-moon'              "남핑
Plug 'skielbasa/vim-material-monokai'
Plug 'artanikin/vim-synthwave84'
Plug 'relastle/bluewery.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'phanviet/sidonia'
"----- GUI dibugger ---------
Plug 'puremourning/vimspector'
"----- airline ----------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"================================= Plugins setting ==================================
"----- Nerd Tree -----
" nmap <leader>nt <ESC>:NERDTreeToggle<CR>
map nt :NERDTreeToggle<CR>
"map nt <ESC>:NERDTree<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']    "ignore files in NERDTree
let NERTreeShowHidden=1
"map nt <ESC>:NERDTree<CR>

"map <F3> :NERDTreeToggle<cr>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" ----- ale -----
let g:ale_lint_on_save = 1              "Lint when saving a file
let g:ale_sign_error = '✖'                                                      "Lint error sign
let g:ale_sign_warning = '⚠'                                                    "Lint warning sign
let g:ale_statusline_format =[' %d E ', ' %d W ', '']                           "Status line texts
"let g:ale_linters = {
"\   'python': ['flake8'],
"\}
let g:ale_pattern_options = {
\   '.*\.js$': {'ale_enabled': 0},
\   '.*\.html$': {'ale_enabled': 0},
\}
" shortcuts to next/prev error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_linters = {'javascript': ['eslint']}                                  "Lint js with eslint
" let g:ale_fixers = {'javascript': ['prettier', 'eslint']}                       "Fix eslint errors
" ALEFix, ALEFixSuggest로 fix 사용 가능
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

" ----- Theme settings -----
if has('termguicolors')
    set termguicolors
endif
set background=dark
"colorscheme NeoSolarized

" set background=light
"---everforest
"endif
"set background=dark
"let g:everforest_background = 'hard'
"let g:everforest_enable_italic = 1
"let g:everforest_disable_italic_comment = 1
"colorscheme everforest
"let g:lightline.colorscheme = 'everforest'
"------sonokai
 " Important!!
"if has('termguicolors')
"set termguicolors
"endif
" The configuration options should be placed before `colorscheme sonokai`.
"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1
"colorscheme sonokai
"-----pinkmoon
"set termguicolors
"colorscheme pink-moon
"set background=dark
"------monokai
"set background=dark
"set termguicolors
"let g:materialmonokai_italic=1
"let g:materialmonokai_subtle_spell=1
"colorscheme material-monokai
"colorscheme synthwave84
"colorscheme challenger_deep
"colorscheme sidonia
colorscheme bluewery
" ----- Ctrlp ----
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']       "Ignore in .gitignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'                                           "Ignore node_modules
let g:ctrlp_custom_ignore = {
  \ 'file': '\v\.(pyc|so|dll)$',
  \ }

nnoremap <leader>. :CtrlPTag<cr>

" ------ silver_searcher -------
let g:ackprg = 'ag --nogroup --nocolor --column'

" ------ fzf ------
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

" ------ terminal mode --------
" use Esc to enter Terminal Normal mode
if has("nvim")
  tnoremap <Esc> <c-\><c-n>
endif
" ------ vim fzf --------
" avoid interferance with terminal mode key mapping
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif
" --------- airline ------------
let g:airline_powerline_fonts = 1
" --------- vimspector -------------
let g:vimspector_enable_mappings = 'HUMAN'

source ~/.vimrc
