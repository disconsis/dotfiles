" Vundle
" ======
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
" Plugin 'scrooloose/nerdtree'
Plugin 'python-mode/python-mode'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/ZoomWin'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'michaeljsmith/vim-indent-object'
" Plugin 'ying17zi/vim-live-latex-preview'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'mikewest/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
call vundle#end()
filetype plugin indent on

" Font options
" ============
set encoding=utf-8
let g:airline_powerline_fonts=1

" Colours
" =======
set t_Co=256
" light scheme →
" --------------
" set background=light
" colorscheme solarized
" let g:solarized_termcolors=256
" let g:airline_theme='sol'
" dark scheme →
" -------------
colorscheme monokai
let g:airline_theme='dark'

" Miscellaneous
" =============
let mapleader="\<space>"
set showcmd
set hidden
set laststatus=2    " always show statusline
set ttimeoutlen=10  " reduce latency in leaving insert mode
set nohlsearch
syntax enable
set noshowmode
set wrap
nnoremap Y y$

" Swap actual & virtual lines
" ===========================
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Line numbering
" ==============
set ruler
set number
set norelativenumber
" move b/w rel & abs numbering
nnoremap <leader>nn :set norelativenumber number<cr>:<bs>
nnoremap <leader>nr :set relativenumber nonumber<cr>:<bs>

" Search options
" ==============
set nohlsearch
set ignorecase
set incsearch
nnoremap <leader>sh :set hlsearch<cr>:<cr>
nnoremap <leader>sn :set nohlsearch<cr>:<cr>

" Indentation
" ===========
set autoindent
set wrap
set expandtab
set tabstop=4
set shiftwidth=4
set list listchars=extends:⇒,precedes:⇒,tab:»\ ,trail:·

" autocomplete options
" ====================
set wildmenu
set wildmode=full
set completeopt=menu

" Change cursor in insert and normal modes
" ========================================
if exists('$TMUX')
    let &t_SI="\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI="\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI="\e[5 q"
    let &t_EI="\e[2 q"
endif

" Sensible splits
" ===============
set splitbelow
set splitright

" Empty out line/whitespace
" =========================
" for line
nnoremap <leader>ee 0"_d$
" for whitespace
nnoremap <leader>ew $gel"_D

" Miscellaneous mappings
" ======================
" open tabs faster
cnorea tnew tabnew
" find len of visually selected area
vnoremap <leader>l "cy:echo len(<c-r>c)<cr>
" insert lines above and below
nnoremap ]<space> o<esc>k
nnoremap [<space> O<esc>j
" fix saving
cnoremap W w

" change case
" ===========
nnoremap <leader>cu gUiw
nnoremap <leader>cc g~iw
nnoremap <leader>cl guiw

" tmux-navigator options
" ======================
let g:tmux_navigator_disable_when_zoomed=1

" airline-tabline options
" =======================
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':.'
let g:airline#extensions#tabline#fnamecollapse=0
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_tab_type=0
let g:airline#extensions#tabline#show_close_button=0

" airline-statusline options
" ==========================
let g:airline_section_b = '%{getcwd()}'

" autocorrect
" ===========
inorea adn and
inorea tehn then
inorea intsall install
inorea reutrn return
inorea -> →
" ↑ add a java exception?

" brace completion
" ================
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap ` ``<esc>i
inoremap <c-h> <esc>i
inoremap <c-l> <esc>la

" vimrc settings
" ==============
augroup vimrc_
    autocmd!
    " underlining
    autocmd Syntax vim nnoremap <buffer> <leader>= yypv$r=r"lr<space>
    " augroup block completion (get back to this after learning to use special
    " chars in autocmd) (this one works btw, except for the autocmd thing)
    " autocmd Syntax vim inorea <buffer> augroup augroup<cr><c-d>augroup END<esc>ka
    " edit vimrc
    autocmd VimEnter,WinEnter,TabEnter * nnoremap <leader>ve :e $MYVIMRC<cr>
    autocmd BufNewFile,BufRead * nnoremap <leader>ve :w<cr>:e $MYVIMRC<cr>
    autocmd Syntax vim inoremap <buffer> " "
augroup END
" edit & reload vimrc
nnoremap <leader>vs :vsp $MYVIMRC<cr>
nnoremap <leader>vt :tabnew $MYVIMRC<cr>
nnoremap <leader>vr :source $MYVIMRC<cr>
cnorea vrc $MYVIMRC

" vimwiki settings
" ================
augroup wikia_
    autocmd!
    " no width restrictions
    autocmd Syntax vimwiki setlocal colorcolumn=""
    autocmd Syntax vimwiki setlocal textwidth=0
    " need ' in normal text, so...
    " autocmd Syntax vimwiki iunmap ' → returns error
augroup END

" help settings
" =============
augroup helptype_
    autocmd!
    " no numbering
    autocmd Syntax help setlocal noruler
    " no width restrictions
    autocmd Syntax help setlocal colorcolumn=""
    autocmd Syntax help setlocal textwidth=0
    " no listchars ∵ tabs
    autocmd Syntax help setlocal nolist
augroup END

" quickfix settings
" =================
augroup quickfix_
    " no width restrictions
    autocmd Syntax qf setlocal colorcolumn=""
    autocmd Syntax qf setlocal textwidth=0
    " absolute numbering
    autocmd Syntax qf setlocal number norelativenumber
augroup END

" i3config settings
" =================
cnorea i3c ~/.config/i3/config
cnorea i3d ~/.config/i3
cnorea i3bc ~/.config/i3blocks/config
cnorea i3bd ~/.config/i3blocks
augroup config_
    autocmd!
    " no width restrictions
    autocmd Syntax conf setlocal colorcolumn=""
    autocmd Syntax conf setlocal textwidth=0
augroup END
" find out no of occurrences of visually selected area

" python settings
" ===============
augroup python_
    autocmd!
    autocmd Syntax python set textwidth=79
    autocmd Syntax python set colorcolumn=80
    autocmd Syntax python inoremap ' ''<esc>i
    autocmd Syntax python let g:pymode_rope=0 "so slow!!!
augroup END

" LaTeX settings
" ==============
let g:livepreview_previewer = 'okular'

" Keys mapped
" ===========
" <leader>
"     n
"         n
"         r
"     s
"         h
"         n
"     u
"     =
"     v
"         e
"         s
"         t
"         r
"     e
"         e
"         w
"     r (python-mode)
"  ketan ketan  dsf ketan blah
