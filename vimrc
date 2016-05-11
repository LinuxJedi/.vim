set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Rykka/riv.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'jacoborus/tender'
call vundle#end()

filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=4
set expandtab
set modeline
set modelines=5
set cursorline

set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

match ErrorMsg '\s\+$'
set ruler
set t_Co=256
set background=dark
colorscheme tender
set number
set bs=2
set et
set hlsearch
set incsearch
set showmatch
set ai
set mps+=<:>
set laststatus=2
set listchars+=precedes:<,extends:>
set wildignore=*.o,*.lo,*.swp,*.bak,*.pyc,*.class
set mouse=a

" Indent numbers down the margin
"set fdc=2
"set fdm=indent
"set fdl=100

"if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
"endif
"let g:airline#extensions#branch#enabled = 1

"This option slows console VIM a lot
"let g:airline#extensions#tabline#enabled = 1

"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'

let g:lightline = { 'colorscheme': 'tender',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '▶', 'right': '◀' },
      \ 'subseparator': { 'left': '▶', 'right': '◀' }
      \ }

let g:riv_disable_folding = 1
let g:riv_highlight_code = 'lua,python,cpp,javascript,vim,sh,c,bash,nginx'

let g:riv_auto_format_table = 0
let g:hybrid_custom_term_colors = 1

au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,*/nginx.conf set filetype=nginx

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
