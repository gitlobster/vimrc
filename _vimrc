set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

" VIM 7 configuration file
" Maintainer:   Dmitry Vasiliev <dima@hlabs.spb.ru>
" URL:          http://hlabs.spb.ru/vim/recipes.html
" Last Change:  2008-12-30
" Version:      0.2

" Not compatible with Vi
set nocompatible
filetype off
set rtp+=c:/Users/Delphi/vimfiles/bundle/Vundle.vim/
call vundle#begin('c:/Users/Delphi/vimfiles/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'nightsense/vim-crunchbang'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'tmhedberg/matchit'
Plugin 'digitaltoad/vim-pug'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'csscomb/vim-csscomb'
Plugin 'sbdchd/neoformat'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
filetype on

"call fuf#setOneTimeVariables(['g:fuf_coveragefile_globPatterns', ['*']])

" Выключить виртуальный звонок
"if has('gui_macvim')
"    set visualbell
"else
"    set novisualbell
"endif

set noeb vb t_vb=
au GUIEnter * set vb t_vb=

" GUI options
if has("gui")
    set guioptions+=abghr
    set guioptions-=T

    set guipty

    set columns=80
    set lines=50
endif

" При отступах не снимать выделение
vnoremap < <gv
vnoremap > >gv

" Выделить последний вставленный текст
nnoremap gV `[v`]

set guioptions-=m  "remove menu bar

" Automatically insert comment character if we need to
set formatoptions+=ntcroq2

" Highlight and autocomplete search
set hlsearch
set incsearch

" Some automatic cursor moving
set autoindent
set nostartofline

" Don't make chaos on my display
set nowrap
set backspace=indent,eol,start
set nojoinspaces

" Some information is always good 
set showfulltag
set report=0
set shortmess-=aI
set shortmess+=T

set wildmenu
set laststatus=2
set statusline=%<%f\ [%Y%R%W]%1*%{(&modified)?'\ [+]\ ':''}%*%=%c%V,%l\ %P\ [%n]

set helpheight=12
set winminheight=0

" I want to see some context around
set scrolloff=2
set sidescrolloff=5
" ...and maybe even all around
" set scrolloff=999
set sidescroll=15

set noswapfile
set hidden


:set guifont=Consolas 
" Key mapping for Russian QWERTY keyboard in UTF-8
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .

set ignorecase

" Nice :list or :set list
set listchars=tab:>-,trail:.,extends:+,eol:$,precedes:+

set fillchars="vert: ,fold:-"

" Fold options
" set foldcolumn=4
" set columns=84
set nofoldenable

" Diff options
set diffopt=filler,context:3

" Always save some info for next time
set history=2000
set viminfo='200,h,%
" Don't save options to session file - it's possibly buggy
set sessionoptions-=options

" Pretty select with mouse and shifted special keys
behave mswin
" ...but not reset selection with not-shifted special keys
set keymodel-=stopsel
set selection=inclusive

" Highlight syntax
syntax on

filetype plugin indent on

" It's not an MS Word clone
set secure

set fileencodings=ucs-bom,utf-8,cp1251,default,latin1

set encoding=utf-8

" Color scheme
colorscheme crunchbang
"color runchbang

highlight clear LineNr

let g:jsx_pragma_required = 0


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ctrlp_regexp = 1



"let g:syntastic_javascript_checkers = ['eslint']


" Python syntax options
"let python_highlight_all = 1

" Indent commands
"com SpaceIndent :set tabstop=4| set shiftwidth=4| set expandtab
"com TabIndent :set tabstop=8| set shiftwidth=8| set noexpandtab
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set number 

nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc>:BufExplorer<cr>

" F6 - предыдущий буфер
nmap <C-F6> :bp<cr>
vmap <C-F6> <esc>:bp<cr>i
imap <C-F6> <esc>:bp<cr>i

" F7 - следующий буфер
nmap <C-F7> :bn<cr>
vmap <C-F7> <esc>:bn<cr>i
imap <C-F7> <esc>:bn<cr>i

nmap <C-N>v :NERDTree<cr>
vmap <C-N>v <esc>:NERDTree<cr>i
imap <C-N>v <esc>:NERDTree<cr>i

nmap <C-N>x :NERDTreeClose<cr>
vmap <C-N>x <esc>:NERDTreeClose<cr>i
imap <C-N>x <esc>:NERDTreeClose<cr>i


map <Leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)

"nmap sj :FufBuffer<cr>
"vmap sj :FufBuffer<cr>
nmap sj :CtrlPBuffer<cr>
vmap sj :CtrlPBuffer<cr>

autocmd FileType javascript setlocal formatprg=prettier\ --stdin

:let loaded_matchparen  = 1
