" plugins to explore more
" - fzf
" - abolish
" - ultisnips

" vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
" Always on
" =========
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'vim-scripts/ZoomWin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'michaeljsmith/vim-indent-object'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'sjl/gundo.vim'
Plug 'alvan/vim-closetag'
Plug 'tmhedberg/SimpylFold'
Plug 'Konfekt/FastFold'
Plug 'jiangmiao/auto-pairs'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vim-scripts/Tabmerge'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-speeddating'
Plug 'vimoutliner/vimoutliner'
Plug 'jacoborus/tender.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'


" Syntax files
" ============
Plug 'gburca/vim-logcat'
Plug 'Harenome/vim-mipssyntax'

" Occasional use
" ==============
" Plugin 'easymotion/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'vim-scripts/DrawIt'
Plug 'Yggdroot/indentLine'
" Plugin 'junegunn/vader.vim'
" Plugin 'vim-scripts/SyntaxRange'
" Plugin 'xuhdev/vim-latex-live-preview'
" Plugin 'scrooloose/nerdtree'

" Unused
" ======
" Plugin 'jceb/vim-orgmode'
" Plugin 'roxma/vim-paste-easy'
" Plugin 'shougo/vimproc'
" Plugin 'shougo/vimshell'
" Plugin 'JamshedVesuna/vim-markdown-preview'
" Plugin 'mikewest/vim-markdown'
call plug#end()
" }}}

set foldmethod=syntax
autocmd VimEnter * RainbowParentheses

" Font options {{{
set encoding=utf-8
let g:airline_powerline_fonts = 1
set guifont=Mononoki\ Nerd\ Font\ 10
" for teh italics
" set t_ZH=[3m
" set t_ZR=[23m
" }}}

" minimal gui {{{
set guioptions=agit
" }}}

" Colours {{{
set t_Co=256
" Monokai {{{
    " colorscheme monokai
    " let g:airline_theme = 'dark'
" }}}
" Gruvbox {{{
    " colorscheme gruvbox
    " set background=dark
    " let g:airline_theme = 'gruvbox'
    " let g:gruvbox_contrast_dark = 'hard'
    " let g:gruvbox_italic = 1
    " let g:gruvbox_invert_selection = 0
    " let g:gruvbox_italicize_strings = 1
" }}}
" Tender {{{
    colorscheme tender
" }}}
"
" }}}

" Miscellaneous {{{
set nocompatible
set mouse=a "enable mouse
set fillchars=vert:│
let mapleader = ","
let maplocalleader = ","
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
" don't fold at start
set foldlevelstart=99
" HTML FTW
packadd! matchit
" let g:monokai_term_italic = 1
" }}}

" Gundo settings {{{
let g:gundo_prefer_python3 = 1
nnoremap <F7> :GundoToggle<cr>
" }}}

" Swap actual & virtual lines " {{{
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gj j
nnoremap <silent> gk k
" }}}

" Line numbering " {{{
set ruler
set number
set norelativenumber
" move b/w rel & abs numbering
" nnoremap <silent> <leader>nn :set norelativenumber number<cr>
" nnoremap <silent> <leader>nr :set relativenumber nonumber<cr> "resolve conflict with NrrwRgn
" }}}

" Search options " {{{
set nohlsearch
set ignorecase
set incsearch
nnoremap <silent> <leader>sh :set hlsearch<cr>
nnoremap <silent> <leader>sn :set nohlsearch<cr>
" }}}

" Indentation " {{{
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set list listchars=extends:⇒,precedes:⇒,tab:\ \ ,trail:·
" }}}

" wrapping {{{
set wrap
set linebreak
set breakindent
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

" Clear whitespace {{{
nnoremap <silent> <leader>ew :silent! s/\v\s+$//g<cr>
" }}}

" Miscellaneous mappings {{{
" open tabs faster
cnorea tnew tabnew
" find len of visually selected area
vnoremap <leader>l "cy:echo len(<c-r>c)<cr>
" insert lines above and below
nnoremap ]<space> o<esc>k
nnoremap [<space> O<esc>j
" }}}

" Space before nu {{{
augroup _nu
    autocmd!
    autocmd BufRead,BufWritePost * if &number | let &nuw = float2nr(ceil(log10(line('$')))) + 2 | endif
augroup END
" }}}

" change case " {{{
nnoremap <leader>cu mzgUiw`z
nnoremap <leader>cc mzg~iw`z
nnoremap <leader>cl mzguiw`z
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
let g:max_cwd_length = 20

function! GetTruncatedCwd()
    let dirname = fnamemodify(getcwd(), ":~")
    if dirname ==# "~/"
        return "~"
    endif
    if strlen(dirname) <= g:max_cwd_length
        return dirname
    else
        return "…" . dirname[-g:max_cwd_length + 1:]
    endif
endfunction
let g:airline_section_b = '%{GetTruncatedCwd()}'
" }}}

" vimshell options " {{{
let g:vimshell_user_prompt='fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt="$ "
" }}}

" youcompleteme options " {{{
" let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_server_log_level = 'debug'
" }}}

" {{{ indentLine settings
let g:indentLine_setColors = 1 " overwrite default/colorscheme color for conceal
let g:indentLine_color_term = 235
let g:indentLine_char = '▏'
" IndentLinesDisable
" }}}

" autocorrect " {{{
inorea adn and
inorea tehn then
inorea intsall install
inorea reutrn return
" }}}

" completion " {{{
let g:AutoPairsMapCh = 0
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
    autocmd VimEnter,WinEnter,TabEnter * nnoremap <silent> <leader>ve :e $MYVIMRC<cr>
    autocmd BufNewFile,BufRead * nnoremap <silent> <leader>ve :w<cr>:e $MYVIMRC<cr>
    autocmd Syntax vim inoremap <buffer> " "
augroup END
" edit & reload vimrc
nnoremap <silent> <leader>vs :vsp $MYVIMRC<cr>
nnoremap <silent> <leader>vt :tabnew $MYVIMRC<cr>
nnoremap <silent> <leader>vr :source $MYVIMRC<cr>
cnorea vrc $MYVIMRC
" }}}

" vimwiki settings " {{{
augroup wikia_
    autocmd!
    " no width restrictions
    autocmd Syntax vimwiki setlocal colorcolumn=""
    autocmd Syntax vimwiki setlocal textwidth=0
augroup END
" }}}

" nerdtree settings {{{
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
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
" }}}

" {{{ i3config settings
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
" }}}

" {{{ python settings
augroup python_
    autocmd!
    autocmd Syntax python setlocal textwidth=79
    " autocmd Syntax python setlocal colorcolumn=80
    autocmd Syntax python call matchadd('ColorColumn', '\%80v')
    autocmd Syntax python hi ColorColumn ctermbg=88
    autocmd Syntax python inoremap ' ''<esc>i
augroup END
" }}}

" {{{ asm settings
augroup asm_
    autocmd!
    autocmd Syntax asm setlocal commentstring=;\ %s
    autocmd Syntax mips setlocal commentstring=#\ %s
augroup END
" }}}

" {{{ LaTeX settings
let g:livepreview_previewer = 'zathura'
" }}}

" {{{ vim-markdown settings
let g:vim_markdown_fenced_languages = ['python=python']
let g:vim_markdown_new_list_item_indent = 0
" hi htmlLink cterm=underline ctermfg=033
" }}}

" incsearch plugin settings {{{
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}

" orgmode {{{
let g:org_indent = 1
" }}}

" vinegar {{{
nnoremap \ <Plug>VinegarUp
" }}}
"
" snippets {{{
let g:UltiSnipsExpandTrigger = "<c-c>"
let g:UltiSnipsJumpForwardTrigger = "<c-s-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-s-k>"
let g:UltiSnipsSnippetsDir = '/home/ketan/.vim/custom_snippets'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', "bundle/vim-snippets/UltiSnips"]
set rtp+=/home/ketan/.vim/custom_snippets
" }}}

" temp {{{

" {{{ GRE notes
augroup gre_notes_
    autocmd!
    autocmd FilterReadPost,FileReadPost,FileReadCmd,BufRead,BufNew,BufEnter GRE\ notes.wiki syntax match String /\v(eg\. )@<=\"\_.{-}\"/
    autocmd FilterReadPost,FileReadPost,FileReadCmd,BufRead,BufNew,BufEnter GRE\ notes.wiki syntax match Identifier /\v^\S+( \{\{\{\s*$)@=/
    autocmd FilterReadPost,FileReadPost,FileReadCmd,BufRead,BufNew,BufEnter GRE\ notes.wiki setlocal foldmethod=marker foldtext=WordNameOnly() foldlevel=0
    function! WordNameOnly()
        let line = getline(v:foldstart)
        let sub = substitute(line, '\v\s+.{-}$', '', '')
        return sub
    endfunction
augroup END

" drawit
" let g:vimwiki_table_auto_fmt = 0
" }}}

" }}}

" vim: fdm=marker
