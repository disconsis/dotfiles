" todo
" - neoterm -> fix issue with terminal normal mode
" - get a decent outliner for configs

" plugins to check out
" - abolish
" - projectionist
" - vim-test
" - dispatch
" - vim-sexp
" - vim-multiple-cursors
" - ale

" features to check out
" - tags (tselect, tjump...)

" vim-plug {{{
" install `vim-plug` for new install {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }}}

call plug#begin('~/.local/share/nvim/plugged')

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
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plug 'tpope/vim-obsession'
Plug 'lervag/vimtex'
Plug 'mhinz/neovim-remote'
Plug 'tpope/vim-unimpaired' " overrides >.. - causes delays while indenting
Plug 'rayburgemeestre/phpfolding.vim'
Plug 'eagletmt/neco-ghc'
" Plug 'Valloric/YouCompleteMe', { 'do': 'python install.py' }
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-abolish'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'datanoise/vim-dispatch-neovim'
Plug 'mhinz/vim-grepper'
Plug 'janko-m/vim-test'
Plug 'othree/xml.vim'
Plug 'SirVer/ultisnips'
Plug 'airblade/vim-gitgutter'
Plug 'wincent/terminus'
Plug 'miyakogi/seiya.vim'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'dag/vim-fish'
Plug 'kassio/neoterm'
Plug 'matze/vim-ini-fold'
Plug 'ticki/rust-cute-vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
" Plug 'enomsg/vim-haskellConcealPlus' " TODO: figure out font synergy
Plug 'simeji/winresizer'
Plug '~/vim-plugins/neatfold.vim'
Plug '~/vim-plugins/synstack.vim'
Plug '~/vim-plugins/tagbar-haskell'
Plug 'Twinside/vim-haskellFold'
" }}}

" Occasional use {{{
" Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
" Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/DrawIt'
Plug 'Yggdroot/indentLine'
" Plug 'junegunn/vader.vim'
" Plug 'vim-scripts/SyntaxRange'
" Plug 'tpope/vim-scriptease'
" }}}

" Experimental {{{
Plug 'ElmCast/elm-vim'
Plug 'dmix/elvish.vim'
Plug 'w0rp/ale'
Plug 'equalsraf/neovim-gui-shim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'terryma/vim-multiple-cursors'
Plug 'bitc/lushtags'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'neovimhaskell/haskell-vim'
Plug 'nathanaelkane/vim-indent-guides'
" }}}

" ColorSchemes {{{
Plug 'connorholyday/vim-snazzy'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-gruvbox8'
Plug 'flazz/vim-colorschemes'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'nelstrom/vim-mac-classic-theme'
Plug 'chriskempson/base16-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'kaicataldo/material.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'keith/parsec.vim'
Plug '~/vim-colorschemes/spacedust'
Plug 'wimstefan/vim-artesanal'
Plug 'nightsense/vimspectr'
Plug 'majutsushi/tagbar'
Plug 'lilydjwg/colorizer'
" }}}

" Syntax files {{{
Plug 'gburca/vim-logcat'
Plug 'Harenome/vim-mipssyntax'
Plug 'urso/haskell_syntax.vim'
Plug 'vim-scripts/cabal.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/Io-programming-language-syntax'
Plug 'Shougo/neco-syntax'
Plug 'vim-python/python-syntax'
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
let g:seiya_auto_enable = 1 " transparency
" make colorscheme same as kitty -- should work for the themes I have
" currently set in `kitty-invert`
let kitty_color_file = "~/.config/kitty/color.link"
if filereadable(expand(kitty_color_file))
    let colo_name = system("basename $(readlink " . kitty_color_file . ") | cut -d '.' -f 1")
else
    let colo_name = "base16-onedark"
endif
try
    execute "colorscheme " . colo_name
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
    colorscheme base16-onedark
endtry

autocmd Colorscheme * hi LineNr guibg=NONE
autocmd Colorscheme * hi! link MatchParen IncSearch
" make spelling errors more noticeable
autocmd Colorscheme * hi! link SpellBad Error
hi CursorLine guibg=NONE

let g:airline_theme = 'onedark'

" " italics {{{
" augroup italic_
"     autocmd!
"     autocmd Colorscheme *
"                 \ hi Comment gui=italic
"                 " \| hi pythonComment gui=italic
"                 \| if hlexists("pythonDoctest") | hi pythonDoctest gui=italic | endif
"                 \| hi htmlItalic gui=italic
"     autocmd Colorscheme *
"                 \ hi String gui=italic
"                 \| if hlexists("pythonString") | hi pythonString gui=italic | endif
" augroup END
" " }}}
" " }}}

" fast exit {{{
command! Wq wq
" }}}

" Miscellaneous {{{
set title
set lazyredraw " speed up macros by not redrawing
set inccommand=nosplit
" auto-enter terminal mode when entering a terminal window
augroup _term_enter
	autocmd!
	autocmd WinEnter term://* :normal! A
augroup END
set scrolloff=1
set noautochdir
set mouse=a "enable mouse
set fillchars=vert:│,fold:─
let mapleader = ","
let maplocalleader = "," | nnoremap <space> ,
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
set nocursorline
" }}}

" providers {{{
let g:python3_host_prog = '/usr/bin/python3.8'
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
set nonumber
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

set nuw=2

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
    \ 't' : 'T',
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

" " youcompleteme options {{{
" let g:ycm_server_python_interpreter = '/usr/bin/python3.8'
" let g:ycm_server_log_level = 'debug'
" " }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" language servers {{{
" let g:LanguageClient_serverCommands =  {
"             \ 'sh': ['bash-language-server', 'start']
"             \ }
" }}}

" indentLine settings {{{
let g:indentLine_enabled = 0
let g:indentLine_setColors = 1 " overwrite default/colorscheme color for conceal
let g:indentLine_color_term = 240
let g:indentLine_char = '▏'
" }}}

" autocorrect {{{
cnorea tnew tabnew
inorea adn and
inorea tehn then
inorea intsall install
inorea reutrn return
inorea teh the
inorea hte the
inorea maliciuos malicious
" }}}

" autopairs {{{
let g:AutoPairsMapCh = 0

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
let g:vimwiki_folding = 'list'
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
    autocmd Syntax python setlocal colorcolumn=72,80
    " autocmd Syntax python call matchadd('ColorColumn', '\%80v')
    " autocmd Syntax python hi ColorColumn ctermbg=88
    " autocmd Syntax python hi CommentColorColumn ctermbg=236 guibg=gray16
    " autocmd Syntax python hi CodeColorColumn ctermbg=238 guibg=gray20
    " autocmd Syntax python call matchadd('CommentColorColumn', '\%72v')
    " autocmd Syntax python call matchadd('CodeColorColumn', '\%80v')
    autocmd Syntax python inoremap ' ''<esc>i
augroup END
" }}}

" asm settings {{{
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

" netrw {{{
let g:netrw_list_hide = ',^\.\.\=/\=$,^__pycache__$,^\.pytest_cache$'  " fix
let g:netrw_liststyle = 0
" }}}

" vimtex {{{
let g:vimtex_fold_enabled = 1
let g:vimtex_compiler_method = "latexmk"
let g:vimtex_view_method = "zathura"
" let g:ycm_semantic_triggers = {
"             \ 'tex': g:vimtex#re#youcompleteme,
"             \ }
let g:vimtex_quickfix_latexlog = {
      \ 'default':    1,
      \ 'general':    1,
      \ 'references': 1,
      \ 'overfull':   0,
      \ 'underfull':  0,
      \ 'font':       1,
      \ 'packages': {
      \   'default':  1,
      \   'natbib':   1,
      \   'biblatex': 1,
      \   'babel':    1,
      \   'hyperref': 1,
      \   'scrreprt': 1,
      \   'fixltx2e': 1,
      \   'titlesec': 1,
      \ },
      \}
autocmd VimLeavePre *.tex VimtexClean
" }}}

" fix commentstrings {{{
augroup commentstring_
    autocmd!
    autocmd Syntax asm setlocal commentstring=;\ %s
    autocmd Syntax mips setlocal commentstring=#\ %s
    autocmd Syntax php setlocal commentstring=//\ %s
    autocmd Syntax c setlocal commentstring=//\ %s
    autocmd Syntax cpp setlocal commentstring=//\ %s
    autocmd Syntax dosini setlocal commentstring=;\ %s
    autocmd Syntax elvish setlocal commentstring=#\ %s
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
" }}}

" fzf {{{
nnoremap <C-p> :<C-u>FZF<CR>
" TODO: unmap <c-j> and <c-k> for search navigation

let g:fzf_action= {
    \ 'ctrl-t': 'tab-split',
    \ 'ctrl-s': 'split',
    \ 'ctrl-v': 'vsplit'
    \ }
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
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-h>"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/custom_snippets'
let g:UltiSnipsSnippetDirectories = ['UltiSnips',"custom_snippets"]
let g:ultisnips_python_style = 'sphinx'
let g:ultisnips_python_quoting_style = 'double'
" }}}

" neoterm {{{
let g:neoterm_autoscroll = '1'
let g:neoterm_automap_keys = mapleader . "tr"
let g:neoterm_autoinsert = 1
nnoremap <silent> <leader>tt :TtoggleAll<CR>
" DEBUG
" FIXME
tnoremap <leader>cl <C-\><C-n>:Tclear<CR>A
" }}}

" vim-test {{{
let test#strategy = 'dispatch'
" }}}

" terminal {{{
" go into normal mode
tnoremap <C-v><Esc> <C-\><C-n>
" unhindered navigation
tnoremap <C-h> <C-\><C-n>:TmuxNavigateLeft<CR>
tnoremap <C-j> <C-\><C-n>:TmuxNavigateDown<CR>
tnoremap <C-k> <C-\><C-n>:TmuxNavigateUp<CR>
tnoremap <C-l> <C-\><C-n>:TmuxNavigateRight<CR>
" }}}

" gitgutter {{{
set updatetime=500
" let g:gitgutter_sign_added              = '+'
" let g:gitgutter_sign_modified           = '~'
" let g:gitgutter_sign_removed            = '-'
" let g:gitgutter_sign_removed_first_line = '='
" let g:gitgutter_sign_modified_removed   = '≃'

let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'

let g:gitgutter_override_sign_column_highlight = 1
hi GitGutterAdd guibg=NONE
hi GitGutterDelete guibg=NONE
hi GitGutterChange guibg=NONE
hi GitGutterChangeDelete guibg=NONE
" }}}

" io {{{
autocmd BufRead *.io set filetype=io
" }}}

" minimal ui {{{
function! MinimalUi()
    set showtabline=1
    set laststatus=0
    set norelativenumber
    set nonumber
    set noruler
    SeiyaEnable
    hi NonText guifg=bg guibg=NONE
endfunction
function! CompleteUi()
    set showtabline=2
    set laststatus=2
    set number
    set ruler
    SeiyaDisable
endfunction
command! MinimalUi execute "call MinimalUi()"
command! CompleteUi execute "call CompleteUi()"
" }}}

" markdown {{{
autocmd Syntax markdown set tabstop=2 shiftwidth=2
" }}}

" seiya {{{
let g:seiya_target_groups = ['guibg']
" }}}

" ligatures-color {{{
augroup ligatures_
    autocmd!
    autocmd Syntax haskell
                \ autocmd OptionSet * hi! link Conceal Operator
    autocmd Syntax rust
                \ autocmd OptionSet * hi! link Conceal Operator
augroup END
" }}}

" haskell {{{
augroup haskell_
    autocmd!
    autocmd Syntax haskell setlocal textwidth=79
    autocmd Syntax haskell setlocal colorcolumn=+1
    autocmd Syntax haskell setlocal formatprg=stylish-haskell
    nnoremap <silent> <leader>p V:!pointless<CR>
augroup END
" }}}

" run-prog {{{
function! RunProg()
    if &syntax == "rust"
        T cargo build; cargo run
    elseif (&syntax == "haskell" || &syntax == "lhaskell")
        T runghc  %
    endif
endfunction

nnoremap <leader>r :call RunProg()<CR>

nnoremap <leader>cl :Tclear<CR>
" }}}

" tabular {{{
nnoremap <leader>a= :Tabularize /\V\ \zs=\ze\ <CR>
vnoremap <leader>a= :Tabularize /\V\ \zs=\ze\ <CR>
nnoremap <leader>a: :Tabularize /:\zs<CR>
vnoremap <leader>a: :Tabularize /:\zs<CR>
" }}}

" python-syntax {{{
let g:python_highlight_all = 1
" }}}

" tagbar {{{
nnoremap <silent> <leader>t :TagbarToggle<CR>
" }}}

" vim-workspace {{{
let g:workspace_undodir = "/home/ketan/tmp/.vim/undodir"
" }}}

" colorizer {{{
let g:colorizer_maxlines = 1000
" }}}

" win-resizer {{{
" nunmap <C-e>
" silent nnoremap <C-w>e :WinResizerStartResize<CR>
let g:winresizer_start_key = "<C-w><C-e>"
" }}}

" ale {{{
let g:ale_linters = {
            \'haskell': ['stack-ghc-mod', 'hlint'],
            \}
" }}}

" haskell-concealPlus {{{
"'q' option to disable concealing of scientific constants (e.g. π)
" ℘' option to disable concealing of powerset function
"'𝐒' option to disable String type to 𝐒 concealing
"'𝐓' option to disable Text type to 𝐓 concealing
"'𝐄' option to disable Either/Right/Left to 𝐄/𝑅/𝐿 concealing
"'𝐌' option to disable Maybe/Just/Nothing to 𝐌/𝐽/𝑁 concealing
"'A' option to not try to preserve indentation
"'s' option to disable space consumption after ∑,∏,√ and ¬ functions
"'*' option to enable concealing of asterisk with '⋅' sign
"'x' option to disable default concealing of asterisk with '×' sign
"'E' option to enable ellipsis concealing with ‥  (two dot leader)
"'e' option to disable ellipsis concealing with … (ellipsis sign)
"'⇒' option to disable `implies` concealing with ⇒
"'⇔' option to disable `iff` concealing with ⇔
"'r' option to disable return (η) and join (µ) concealing
"'b' option to disable bind (left and right) concealing
"'f' option to enable formal (★) right bind concealing
"'c' option to enable encircled b/d (ⓑ/ⓓ) for right and left binds
"'h' option to enable partial concealing of binds (e.g. »=)
"'C' option to enable encircled 'm' letter ⓜ concealing for fmap
"'l' option to disable fmap/lift concealing with ↥
"'↱' option to disable mapM/forM concealing with ↱/↰
"'w' option to disable 'where' concealing with 'due to'/∵ symbol
"'-' option to disable subtract/(-) concealing with ⊟
"'I' option to enable alternative ':+' concealing with with ⨢
"'i' option to disable default concealing of ':+' with ⅈ
"'R' option to disable realPart/imagPart concealing with ℜ/ℑ
"'T' option to enable True/False constants concealing with bold 𝐓/𝐅
"'t' option to disable True/False constants concealing with italic 𝑇/𝐹
"'B' option to disable Bool type to 𝔹 concealing
"'Q' option to disable Rational type to ℚ concealing
"'Z' option to disable Integer type to ℤ concealing
"'N' option to disable Natural, Nat types to ℕ concealing
"'D' option to disable Double type to 𝔻 concealing
"'C' option to disable Complex type to ℂ concealing
"'1' option to disable numeric superscripts concealing, e.g. x²
"'a' option to disable alphabet superscripts concealing, e.g. xⁿ
let hscoptions = "*x↱⇒⇔"
" }}}

" augment unimpaired {{{
nnoremap <silent> ]h :set hlsearch<CR>
nnoremap <silent> [h :set nohlsearch<CR>
" }}}

" easier global commands {{{
vnoremap ,g :g/^/normal! 
" }}}
"

" vim: fdm=marker
