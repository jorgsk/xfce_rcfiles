" first of all point to anaconda python installation
"let g:python3_host_prog = '/home/jorgens/anaconda3/bin/python'
"
" Set mapleader to semicolion
let mapleader =";"

call plug#begin('~/.vim/plugged')

" fancier status line which makes it easy to get git status for file
Plug 'itchyny/lightline.vim'
set noshowmode
" git status line in lightline
Plug 'itchyny/vim-gitbranch'
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" back to bufexplorer?
Plug 'jlanzarotta/bufexplorer'
nnoremap <leader>bf :BufExplorerVerticalSplit<CR>

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
nnoremap <C-f> :FZF<CR>

" nord scheme
Plug 'arcticicestudio/nord-vim'
Plug 'nanotech/jellybeans.vim'

" test utilsnips for latex
Plug 'SirVer/ultisnips'

" you need this, otherwise only .latex files will be expanded, not .tex
let g:tex_flavor = "latex"

" trying vimtex again to get rid of the annoying _ and ^ highlights. will it
" slow down everything again?
Plug 'lervag/vimtex'

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'honza/vim-snippets'

"Plug 'honz/vim-snippets'

" Color highligting based on syntax analysis
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Ale for linting
Plug 'dense-analysis/ale'
let g:ale_linters = {
\   'python': ['flake8', 'mypy'],
\}
let g:ale_set_highlights = 0 " could not config to be only underline, ugly red blob
" Linter options (wish ale could use the liters' config files)
let g:ale_python_mypy_options = '--warn-no-return --ignore-missing-imports'
let g:ale_python_flake8_options = '--ignore=E501'
"
"""""""""""""" NCM 2"""""""""""""""""
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-path'
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
  "'on_complete': ['ncm2#on_complete#delay', 180,
               "\ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'ncm2#on_complete#delay', 180,'csscomplete#CompleteCSS'],
        \ })

""""" NCM2 DONE """"""""""

" Indent like a boss
Plug 'hynek/vim-python-pep8-indent'

" Skip out of brackets like '' and ()
Plug 'Raimondi/delimitMate'
imap <C-l> <Plug>delimitMateS-Tab
nmap <C-l> <Plug>delimitMateS-Tab

"""" Let's try something new: project gutentags does not store all your tags in one big file which is a mess
Plug 'ludovicchabant/vim-gutentags'
nmap ]t :tnext<CR>
nmap [t :tlast<CR>
let g:gutentags_exclude_filetypes=['tex']

"""""""""""""""""""""""""" EnhancedCommentify """"""""""""""""""""
Plug 'hrp/EnhancedCommentify'
" Selecting mode for the the EnhancedCommentify script
let g:EnhCommentifyUserMode = 'yes'
let g:EnhCommentifyTraditionalMode = 'no'
let g:EnhCommentifyFirstLineMode = 'no'
let g:EnhCommentifyUserBindings = 'no'
let g:EnhCommentifyRespectIndent = 'Yes'

"""""" Color schemes """"""""
Plug 'Soares/base16.nvim' 

call plug#end()

" insert space in normal mode
nnoremap <Space> i<Space><Right><ESC>

""" Indentation
set shiftwidth=4 "how many columns to shift when using >> and <<
set expandtab "tab will produce spaces
set tabstop=4 "tab=4 columns (=4 spaces with expandtab on)"

" Default text width before linebreak
set tw=95

" Change between most recent buffers with F12 
nnoremap <F12> :b#<CR>
inoremap <F12> <ESC>:b#<CR>

" Line length
autocmd bufreadpre *.tex setlocal textwidth=110
autocmd bufreadpre *.py setlocal textwidth=90

" replace multiple instances on the same line by default
set gdefault

" Autocompete file paths with control-p
imap <C-p> <C-X><C-F>

" Global substitute with 'gs'  
map gs :%s/

" Switch between buffers without saving
set hidden

" Spell settings
" Use zi to pick the first suggested word and go to the next 'red' word!
nmap zi 1z=]s
" Only suggest 5 words with z= during spellcheck
set spellsuggest=5
" Set spell/nospell with F4
imap <F4> <ESC>:setlocal spell!<CR>
nmap <F4> <ESC>:setlocal spell!<CR>

" Vim statusline
"set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%04l,%04v][%p%%]\ [LEN=%L]\ %r
"set laststatus=2

" Enable copy paste to windows apps
set clipboard=unnamed
" Enable visual selection to clipboard
set go+=a

" Use F2 and control l/h to better view CSV files
" enable/disable scrollbar and nowrap at the same time
nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"
"
" Make sure the cursor stays in the middle of the screen when scrolling up and
" down. Avoids having to go all the way to the bottom to scroll down.
set scrolloff=1000

set nohlsearch

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" For Neovim
set termguicolors

" Add tags for python 3rd party libraries
autocmd Filetype python :setlocal tags+=~/.python_standard_library_tags/python_tags

set background=dark
colorscheme jellybeans
