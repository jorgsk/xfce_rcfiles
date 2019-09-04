" first of all point to anaconda python installation
"let g:python3_host_prog = '/home/jorgens/anaconda3/bin/python'

call plug#begin('~/.vim/plugged')

" test utilsnips for latex
Plug 'SirVer/ultisnips'

" you need this, otherwise only .latex files will be expanded, not .tex
let g:tex_flavor = "latex"

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"Plug 'kiryph/vim-snippets'
Plug 'honza/vim-snippets'

"Plug 'honz/vim-snippets'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
"
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

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
imap <C-e> <Plug>delimitMateS-Tab
nmap <C-e> <Plug>delimitMateS-Tab

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

""" Indentation
set shiftwidth=4 "how many columns to shift when using >> and <<
set expandtab "tab will produce spaces
set tabstop=4 "tab=4 columns (=4 spaces with expandtab on)"

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
" Set mapleader to semicolion
let mapleader =";"

" Spell settings
" Use zi to pick the first suggested word and go to the next 'red' word!
nmap zi 1z=]s
" Only suggest 5 words with z= during spellcheck
set spellsuggest=5
" Set spell/nospell with F4
imap <F4> <ESC>:setlocal spell!<CR>
nmap <F4> <ESC>:setlocal spell!<CR>

" Vim statusline
set statusline=%F%m%r%h%w\ [%{&ff}]\ [%Y]\ [%04l,%04v][%p%%]\ [LEN=%L]\ %r
set laststatus=2

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

set background=dark
colorscheme irblack

