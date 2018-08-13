" plugins to check out
" - fzf
" - ultisnips
" - abolish
" - projectionist
" - vim-test
" - vim-gitgutter

" nvim-from-vim {{{
set rtp^=~/.vim
set rtp+=~/.vim/after
set rtp+=/usr/share/vim/vim74
let &packpath = &rtp
" }}}

" vim-plug {{{
" install `vim-plug` for new install {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

call plug#begin('~/.vim/bundle')

" Always on {{{
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'regedarek/ZoomWin'
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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi' "
" Plug 'zchee/deoplete-clang' "FIXME
Plug 'Shougo/neco-vim'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/rainbow_parentheses.vim' "FIXME: causes issues with folding
Plug 'vim-scripts/Tabmerge'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-vinegar'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-speeddating'
Plug 'vimoutliner/vimoutliner'
Plug 'neomake/neomake'
Plug 'tpope/vim-obsession'
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'tpope/vim-unimpaired' " overrides >.. - causes delays while indenting
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py' }
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'datanoise/vim-dispatch-neovim'
Plug 'mhinz/vim-grepper'
Plug 'janko-m/vim-test'
Plug 'hsanson/vim-android'
Plug 'othree/xml.vim'
Plug 'SirVer/ultisnips'
Plug '~/.git/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'wincent/terminus'
Plug 'miyakogi/seiya.vim'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'dag/vim-fish'
" }}}

" Colorschemes {{{
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'flazz/vim-colorschemes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'nelstrom/vim-mac-classic-theme'  " decent light theme (still gives me a headache though)
Plug 'chriskempson/base16-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'keith/parsec.vim'
Plug '~/vim-colorschemes/spacedust'
" }}}

" Syntax files {{{
Plug 'gburca/vim-logcat'
Plug 'Harenome/vim-mipssyntax'
Plug 'vim-scripts/haskell.vim'
Plug 'vim-scripts/cabal.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/Io-programming-language-syntax'
Plug 'Shougo/neco-syntax'
" }}}

" Occasional use {{{
" Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
" Plug 'vim-syntastic/syntastic'
" Plug 'vim-scripts/DrawIt'
Plug 'Yggdroot/indentLine'
" Plug 'junegunn/vader.vim'
" Plug 'vim-scripts/SyntaxRange'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug 'tpope/vim-scriptease'
" }}}

" Unused {{{
" Plug 'jceb/vim-orgmode'
" Plug 'roxma/vim-paste-easy'
" Plug 'shougo/vimshell'
" Plug 'JamshedVesuna/vim-markdown-preview'
" Plug 'mikewest/vim-markdown'
" }}}

" Experimental {{{
Plug '~/vim-plugins/neatfold.vim'
Plug '~/vim-plugins/synstack.vim'
" }}}

call plug#end()
" }}}

" Font options {{{
set encoding=utf-8
let g:airline_powerline_fonts = 1
set guifont=Mononoki\ Nerd\ Font\ 10
" }}}

" minimal gui {{{
set guioptions=agit
" }}}

" Colours {{{
set termguicolors
set background=dark
" let g:seiya_auto_enable = 1 " transparency
colorscheme tender
" Monokai {{{
augroup monokai_
    autocmd!
    autocmd Colorscheme monokai
                \ let g:airline_theme = 'dark'
                \| let g:monokai_term_italic = 1
augroup END
" }}}
" Gruvbox {{{
augroup gruvbox_
    autocmd!
    autocmd Colorscheme gruvbox
                \ set background=dark
                \| let g:airline_theme = 'gruvbox'
                \| let g:gruvbox_contrast_dark = 'hard'
                \| let g:gruvbox_italic = 1
                \| let g:gruvbox_invert_selection = 0
                " \| let g:gruvbox_italicize_strings = 1
augroup END
" }}}
" Gruvbox8 {{{
augroup gruvbox8_
    autocmd!
    autocmd Colorscheme gruvbox8*
                \ set background=dark
                \| let g:gruvbox_transp_bg = 1
                \| let g:airline_theme = 'ubaryd'
augroup END
" }}}
" tender {{{
augroup tender_
    autocmd!
    autocmd Colorscheme tender
                \ let g:airline_theme = 'distinguished'
augroup END
" }}}
" onedark {{{
augroup onedark_
    autocmd!
    autocmd Colorscheme onedark
                \ let g:airline_theme = 'onedark'
                \| hi link netrwMarkFile Identifier
augroup END
" }}}
" afterglow {{{
augroup afterglow_
    autocmd!
    autocmd Colorscheme afterglow
                \ let g:airline_theme = "ubaryd"
                \| hi markdownCode guifg=#e5b567
augroup END
" }}}
" Spacedust {{{
augroup Spacedust_
    autocmd!
    autocmd Colorscheme Spacedust
                \ let g:airline_theme = "base16_harmonic16"
" }}}
" General {{{
augroup general_colorscheme_
    autocmd!
    autocmd Colorscheme *
                \ hi Search guifg=NONE guibg=NONE gui=bold,italic,underline
                \| hi Normal guibg=NONE ctermbg=NONE  " remove window bg for all colorschemes
augroup END
" }}}
" }}}

" italics {{{
augroup italic_
    autocmd!
    autocmd Colorscheme *
                \ hi Comment gui=italic
                " \| hi pythonComment gui=italic
                \| if hlexists("pythonDoctest") | hi pythonDoctest gui=italic | endif
    autocmd Colorscheme * 
                \ hi String gui=italic
                \| if hlexists("pythonString") | normal! hi pythonString gui=italic | endif
augroup END
" }}}

" Miscellaneous {{{
set noautochdir
set mouse=a "enable mouse
set fillchars=vert:│,fold:─
let mapleader = ","
let maplocalleader = ","
" restore , functionality
nnoremap <space> ,
set showcmd
set hidden
set laststatus=2    " always show statusline
set ttimeoutlen=10  " reduce latency in leaving insert mode
set nrformats=      " disable bin/octal/hex number formats
syntax enable
set noshowmode      " already have a statusline
set wrap
set clipboard+=unnamedplus  " use the system clipboard
" make Y do something actually useful (instead of copying yy)
nnoremap Y y$
set undofile        " persistent undo !!!
" stop vim littering every directory
set undodir=~/tmp/.vim/undo
set backupdir=~/tmp/.vim/swap
" HTML FTW
packadd! matchit
set nocursorline
" }}}

" providers {{{
let g:python_host_prog = '/usr/bin/python2.7'
let g:python3_host_prog = '/usr/bin/python3.5'
" }}}

" Functions {{{
function! SetupCommandAlias(input, output)
    exec 'cabbrev <expr> ' . a:input
        \ . ' ((getcmdtype() is# ":" && getcmdline() is# "' . a:input . '")'
        \ . '? ("' . a:output . '") : ("' . a:input . '"))'
endfunction
" }}}

" Gundo settings {{{
let g:gundo_prefer_python3 = 1
nnoremap <F7> :GundoToggle<cr>
" }}}

" Swap actual & virtual lines {{{
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> gj j
nnoremap <silent> gk k
" }}}

" Line numbering {{{
set ruler
set number
set norelativenumber
" }}}

" Search options {{{
set hlsearch
set ignorecase
set incsearch
" }}}

" Indentation {{{
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set list listchars=extends:⇒,precedes:⇒,tab:\ \ ,trail:∙
" langugage specific default shiftwidth {{{
autocmd Syntax ruby,lisp set tabstop=2 shiftwidth=2
" }}}
" }}}

" wrapping {{{
set wrap
set linebreak
set breakindent
" }}}

" autocomplete options {{{
set wildmenu
set wildmode=full
set completeopt=menu
" }}}

" Sensible splits {{{
set splitbelow
set splitright
" }}}

" Clear whitespace {{{
nnoremap <silent> <leader>ew :silent! s/\v\s+$//g<cr>
nnoremap <silent> <leader>eW :silent! %s/\v\s+$//g<cr>
" }}}

" Space before nu {{{
augroup _nu
    autocmd!
    autocmd BufRead,BufWritePost * if &number | let &nuw = float2nr(ceil(log10(0.5 + line('$')))) + 2 | endif
augroup END
" }}}

" tmux-navigator options {{{
let g:tmux_navigator_disable_when_zoomed = 1
" }}}

" tabline {{{
set showtabline=1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '│'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '│'
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

" airline-statusline options {{{
if !exists('g:airline_symbols')
    " to be able to set airline symbols
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_skip_empty_sections = 1
let g:airline#parts#ffenc#skip_expected_string = 'utf-8[unix]'
let g:max_cwd_length = 30
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'
let g:airline_symbols_ascii = 0
let g:airline_powerline_fonts = 1

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

" vimshell options {{{
let g:vimshell_user_prompt='fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt="$ "
" }}}

" youcompleteme options {{{
" let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_server_log_level = 'debug'
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" language servers {{{
" let g:LanguageClient_serverCommands =  {
"             \ 'sh': ['bash-language-server', 'start']
"             \ }
" }}}

" indentLine settings {{{
let g:indentLine_setColors = 1 " overwrite default/colorscheme color for conceal
let g:indentLine_color_term = 240
let g:indentLine_char = '▏'
let g:indentLine_enabled = 0
" }}}

" autocorrect {{{
cnorea tnew tabnew
inorea adn and
inorea tehn then
inorea intsall install
inorea reutrn return
" }}}

" autopairs {{{
let g:AutoPairsMapCh = 0
inoremap <c-h> <left>
inoremap <c-l> <right>

function! RubyAutoPairs()
  let b:AutoPairs = {"'": "'", '''': '''', '`': '`', '"': '"', '{': '}', '(': ')', '[': ']', '|': '|'}
endfunction

function! LispAutoPairs()
  let b:AutoPairs = {'"': '"', '{': '}', '(': ')', '[': ']', '|': '|'}
endfunction

augroup autopairs_
    autocmd!
    autocmd Syntax ruby let b:AutoPairs = {'''': '''', '`': '`', '"': '"', '{': '}', '(': ')', '[': ']', '|': '|'}
    autocmd Syntax lisp let b:AutoPairs = {'"': '"', '{': '}', '(': ')', '[': ']', '|': '|'}
augroup END
" }}}

" vimrc settings {{{
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

" vimwiki settings {{{
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

" help settings {{{
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

" quickfix settings {{{
augroup quickfix_
    " no width restrictions
    autocmd Syntax qf setlocal colorcolumn=""
    autocmd Syntax qf setlocal textwidth=0
    " absolute numbering
    autocmd Syntax qf setlocal number norelativenumber
augroup END
" }}}

" i3config settings {{{
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

" python settings {{{
augroup python_
    autocmd!
    autocmd Syntax python setlocal textwidth=79
    " autocmd Syntax python setlocal colorcolumn=72,80
    " autocmd Syntax python call matchadd('ColorColumn', '\%80v')
    " autocmd Syntax python hi ColorColumn ctermbg=88
    autocmd Syntax python hi CommentColorColumn ctermbg=236 guibg=gray16
    autocmd Syntax python hi CodeColorColumn ctermbg=238 guibg=gray20
    autocmd Syntax python call matchadd('CommentColorColumn', '\%72v')
    autocmd Syntax python call matchadd('CodeColorColumn', '\%80v')
    autocmd Syntax python inoremap ' ''<esc>i
augroup END
" }}}

" asm settings {{{
" }}}

" LaTeX settings {{{
let g:livepreview_previewer = 'zathura'
" }}}

" vim-markdown settings {{{
let g:vim_markdown_fenced_languages = ['python=python', 'logcat=logcat', 'javascript=javascript']
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

" neomake {{{
let g:neomake_python_enabled_makers = ['pylint', 'pycodestyle']
call neomake#configure#automake('w')
" colors
let g:neomake_error_sign   = { 'text': 'E|', 'texthl': 'NeomakeErrorSign'   }
let g:neomake_warning_sign = { 'text': 'W|', 'texthl': 'NeomakeWarningSign' }
let g:neomake_message_sign = { 'text': 'M|', 'texthl': 'NeomakeMessageSign' }
let g:neomake_info_sign    = { 'text': 'I|', 'texthl': 'NeomakeInfoSign'    }
" }}}
"
" netrw {{{
let g:netrw_list_hide = ',^\.\.\=/\=$,^__pycache__$,^\.pytest_cache$'  " fix
let g:netrw_liststyle = 0
" }}}

" vimtex {{{
let g:vimtex_compiler_method = "latexmk"
let g:vimtex_view_method = "zathura"
let g:ycm_semantic_triggers = {
            \ 'tex': g:vimtex#re#youcompleteme,
            \ }
" }}}

" fix commentstrings {{{
augroup commentstring_
    autocmd!
    autocmd Syntax asm setlocal commentstring=;\ %s
    autocmd Syntax mips setlocal commentstring=#\ %s
    autocmd Syntax php setlocal commentstring=//\ %s
    autocmd Syntax c setlocal commentstring=//\ %s
    autocmd Syntax cpp setlocal commentstring=//\ %s
augroup END
" }}}

" rainbow parens {{{
let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]
let g:rainbow#blacklist = [255]
autocmd VimEnter * RainbowParentheses "FIXME: breaks folding
" }}}

" bash {{{
" folding {{{
augroup _bash
    autocmd!
    autocmd FileType,Syntax sh let g:sh_fold_enabled = 4
    autocmd FileType,Syntax sh let g:is_bash = 1
    autocmd FileType,Syntax sh setlocal foldmethod=syntax
augroup END
" }}}
" }}}

" folding {{{
set foldmethod=syntax
" don't fold at start
set foldlevelstart=99
let g:python_folding = 1
let g:c_folding = 1
let g:perl_folding = 1
let g:php_folding = 1
let g:haskell_folding = 1
let g:ruby_folding = 1
let g:vim_folding = 1
let g:conf_folding = 1
let g:xml_syntax_folding = 1
" function! NeatFoldText()
"     let line = substitute(getline(v:foldstart), '\v\s*\{(\{\{)?\s*$', '', 'g') . ' '
"     let lines_count = v:foldend - v:foldstart + 1
"     let lines_count_text = '┨ ' . printf("%10s", lines_count . ' lines') . ' ┠'
"     let foldchar = matchstr(&fillchars, 'fold:\zs.')
"     " let foldtextstart = strpart(repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"     let foldtextstart = line
"     let foldtextend = lines_count_text . repeat(foldchar, 8)
"     let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"     return foldtextstart . repeat(foldchar, winwidth(0) - foldtextlength) . foldtextend
" endfunction
" set foldtext=NeatFoldText()
" }}}

" fzf {{{
nnoremap <C-p> :<C-u>FZF<CR>
" TODO: unmap <c-j> and <c-k> for search navigation
" }}}

" grepper {{{
if !exists('g:grepper')
    let g:grepper = {}
endif
let g:grepper.tools = ['rg', 'git', 'grep']
" search for current word
nnoremap <leader>* :Grepper -cword -noprompt<CR>
" search for current selection
nmap gs <Plug>(GrepperOperator)
xmap gs <Plug>(GrepperOperator)
" set :grep
set grepprg=rg\ -H\ --no-heading\ --vimgrep
set grepformat=$f:$l:%c:%m
call SetupCommandAlias("rg", "GrepperRg")
call SetupCommandAlias("gitgrep", "GrepperGit")
call SetupCommandAlias("grep", "GrepperGrep")
" }}}

" snippets {{{
let g:UltiSnipsExpandTrigger = "<c-c>"
let g:UltiSnipsJumpForwardTrigger = "<c-s-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-s-k>"
let g:UltiSnipsSnippetsDir = '~/.vim/custom_snippets'
let g:UltiSnipsSnippetDirectories = ['UltiSnips',"custom_snippets"]
let g:ultisnips_python_style = 'sphinx'
let g:ultisnips_python_quoting_style = 'double'
" }}}

" vim-test {{{
let test#strategy = 'dispatch'
" }}}

" terminal {{{
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>
" }}}

" gitgutter {{{
set updatetime=500
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_sign_removed_first_line = '='
let g:gitgutter_sign_modified_removed   = '≃'
" }}}

" android {{{
let g:android_sdk_path = "~/Android/Sdk"
" }}}

" io {{{
autocmd BufRead *.io set filetype=io
" }}}

" minimal ui {{{
function! MinimalUi()
    set showtabline=1
    set laststatus=0
    set norelativenumber
endfunction
function! CompleteUi()
    set showtabline=1
    set laststatus=2
    set number
endfunction
command! MinimalUi execute "call MinimalUi()"
command! CompleteUi execute "call CompleteUi()"
" }}}

" markdown {{{
autocmd Syntax markdown set tabstop=2 shiftwidth=2
" }}}

" tmp {{{
let g:seiya_target_groups = ['guibg']
" }}}

" vim: fdm=marker
