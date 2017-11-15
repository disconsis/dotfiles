" Vundle " {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'scrooloose/nerdtree'
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
Plugin 'vim-scripts/SyntaxRange'
Plugin 'vim-syntastic/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'shougo/vimproc'
Plugin 'shougo/vimshell'
Plugin 'alvan/vim-closetag'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Konfekt/FastFold'
Plugin 'easymotion/vim-easymotion'
Plugin 'Konfekt/vim-zeal'
call vundle#end()
filetype plugin indent on
" }}}

" Font options " {{{
set encoding=utf-8
let g:airline_powerline_fonts = 1
" }}}

" Colours " {{{
set t_Co=256
colorscheme monokai
let g:airline_theme = 'dark'
" }}}

" Miscellaneous " {{{
let mapleader = "\,"
" restore , functionality
nnoremap <space> ,
set showcmd
set hidden
set laststatus=2    " always show statusline
set ttimeoutlen=10  " reduce latency in leaving insert mode
set nrformats=      " disable bin/octal/hex number formats
set nohlsearch
syntax enable
set noshowmode      " already have a statusline
set wrap
" make Y do something actually useful (instead of copying yy)
nnoremap Y y$
set undofile        " persistent undo !!!
" stop vim littering every directory
set undodir=~/tmp/.vim/undo
set backupdir=~/tmp/.vim/swap
" HTML FTW
packadd! matchit
" }}}

" Gundo settings {{{
let g:gundo_prefer_python3 = 1
" }}}

" Swap actual & virtual lines " {{{
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
" }}}

" Line numbering " {{{
set ruler
set number
set norelativenumber
" move b/w rel & abs numbering
nnoremap <leader>nn :set norelativenumber number<cr>:<bs>
nnoremap <leader>nr :set relativenumber nonumber<cr>:<bs>
" }}}

" Search options " {{{
set nohlsearch
set ignorecase
set incsearch
nnoremap <leader>sh :set hlsearch<cr>:<cr>
nnoremap <leader>sn :set nohlsearch<cr>:<cr>
" }}}

" Indentation " {{{
set autoindent
set wrap
set expandtab
set tabstop=4
set shiftwidth=4
set list listchars=extends:⇒,precedes:⇒,tab:\ \ ,trail:·
" }}}

" autocomplete options " {{{
set wildmenu
set wildmode=full
set completeopt=menu
" }}}

" Change cursor in insert and normal modes " {{{
if exists('$TMUX')
    let &t_SI="\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI="\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI="\e[5 q"
    let &t_EI="\e[2 q"
endif
" }}}

" Sensible splits " {{{
set splitbelow
set splitright
" }}}

" Empty out line/whitespace " {{{
" for line
nnoremap <leader>ee Vc<esc>
" for whitespace
nnoremap <leader>ew :s/\v\s+$//g<cr>
" }}}

" Miscellaneous mappings " {{{
" open tabs faster
cnorea tnew tabnew
" find len of visually selected area
vnoremap <leader>l "cy:echo len(<c-r>c)<cr>
" insert lines above and below
nnoremap ]<space> o<esc>k
nnoremap [<space> O<esc>j
" }}}

" change case " {{{
nnoremap <leader>cu gUiw
nnoremap <leader>cc g~iw
nnoremap <leader>cl guiw
" }}}

" tmux-navigator options {{{
let g:tmux_navigator_disable_when_zoomed = 1
" }}}

" airline-tabline options " {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':.'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline_mode_map = {
    \ '__': '-',
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'c' : 'C',
    \ 'v' : 'V',
    \ 'V' : 'Vl',
    \ '': 'Vb',
    \ 's' : 'S',
    \ 'S' : 'S',
    \ '': 'S',
    \ }
" }}}

" airline-statusline options " {{{
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:max_cwd_elements = 5

function! Getshortcwd()
    let dirname = fnamemodify(getcwd(), ":~")
    if dirname ==# "~/"
        return "~"
    endif
    if len(split(dirname, '/')) <= g:max_cwd_elements
        return dirname
    else
        return "…/" . join(split(dirname, "/")[-(g:max_cwd_elements-1):], "/")
    endif
endfunction
let g:airline_section_b = '%{Getshortcwd()}'
" }}}

" vimshell options " {{{
let g:vimshell_user_prompt='fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt="$ "
" }}}

" autocorrect " {{{
inorea adn and
inorea tehn then
inorea intsall install
inorea reutrn return
inorea -> →
" ↑ add a java exception?
" }}}

" completion " {{{
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
inoremap " ""<esc>i
inoremap ` ``<esc>i
autocmd Syntax htmldjango inoremap <buffer> % %%<esc>i
autocmd Syntax css inoremap <buffer> /* /*<space><space>*/<esc>hhi
inoremap <c-h> <esc>i
inoremap <c-l> <esc>la
" }}}

" vimrc settings " {{{
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
" }}}

" vimwiki settings " {{{
augroup wikia_
    autocmd!
    " no width restrictions
    autocmd Syntax vimwiki setlocal colorcolumn=""
    autocmd Syntax vimwiki setlocal textwidth=0
    " need ' in normal text, so...
    " autocmd Syntax vimwiki iunmap ' → returns error
augroup END
" }}}

" nerdtree settings {{{
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
" }}}

" help settings " {{{
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
" }}}

" quickfix settings " {{{
augroup quickfix_
    " no width restrictions
    autocmd Syntax qf setlocal colorcolumn=""
    autocmd Syntax qf setlocal textwidth=0
    " absolute numbering
    autocmd Syntax qf setlocal number norelativenumber
augroup END

" i3config settings
" =================
" {{{
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
" {{{
augroup python_
    autocmd!
    autocmd Syntax python setlocal textwidth=79
    autocmd Syntax python setlocal colorcolumn=80
    autocmd Syntax python inoremap ' ''<esc>i
augroup END

" LaTeX settings
" ==============
let g:livepreview_previewer = 'okular'

" vim: fdm=marker
