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
set mouse=h                    "Enable mouse in help mode
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

"================================= Plugins ========================================
call plug#begin('~/.vim/plugged')

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'wakatime/vim-wakatime'            "check coding time
Plug 'jiangmiao/auto-pairs'             "Auto pair for ',), }, ]...
Plug 'airblade/vim-gitgutter'           "Show git status in vim
Plug 'tpope/vim-fugitive'               "Git warpper
Plug 'ctrlpvim/ctrlp.vim'               "Ctrl + P for search file
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

" ------ terminal mode --------
" use Esc to enter Terminal Normal mode
if has("nvim")
  tnoremap <Esc> <c-\><c-n>
endif

"--------vimspector------------
let g:vimspector_enable_mappings = 'HUMAN'
" for normal mode - the word under the cursor
" nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
" xmap <Leader>di <Plug>VimspectorBalloonEval
