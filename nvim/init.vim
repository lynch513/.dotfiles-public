""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" An example for a vimrc file (Neovim edition)
"   Maintainer: lynch513@yandex.ru

" Reload this config file -> :so %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin manager settings (use vim-plug)
set nocompatible
filetype off
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Main plugins
"
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree' ", { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tmhedberg/matchit'
Plug 'Yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Secondary plugins
"
Plug 'w0rp/ale'
" Plug 'vim-syntastic/syntastic'
" Plug 'ervandew/supertab'
"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'dbarsam/vim-rainbow-parentheses'
" Plug 'kien/rainbow_parentheses.vim'
"Plug 'luochen1990/rainbow'
"Plug 'jpalardy/vim-slime'
"Plug 'neomake/neomake'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme plugins
"
Plug 'morhetz/gruvbox'
Plug 'damage220/solas.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'lifepillar/vim-solarized8'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Language plugins
"
" C#
"Plug 'OmniSharp/omnisharp-vim'
" F#
Plug 'adelarsq/neofsharp.vim'
Plug 'ionide/Ionide-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Various file formats
"
Plug 'mattn/emmet-vim'

call plug#end()
filetype plugin indent on " Automatically executes by vim-plug
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My settings
"

" Encoding
set encoding=utf-8

" Spaces instead tabs
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

" String numbers
set number

" Search highlight
set hlsearch
" Incremental search
set incsearch

" Syntax highlight
syntax on

" Show cursor line
set cursorline

" Auto indent
set autoindent

" Colorscheme
"
let g:solarized_use16 = 1
" set termguicolors
" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme solarized8_high
colorscheme solas
" colorscheme gruvbox
" Use g:gruvbox_contrast_light for light theme
" Possible values soft, medium and hard
" let g:gruvbox_contrast_dark='hard'

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Decimal format by default
set nrformats=

" Always show status line
set laststatus=2

" Always jump to the last known cursor position
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" For all text files set 'textWidth' to 80 characters
autocmd FileType text setlocal textwidth=80

" Live reload (then file a externally changed)
set autoread
au CursorHold,CursorHoldI * checktime

" Turn off automatic visual mode on mouse select
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My keymap settings
"
" Exit from insert mode <Alt-L>
" inoremap <a-l> <esc>

" NerdTree shortcut
map <C-N> :NERDTreeToggle<CR>

" move among buffers
" move among tabs
"
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> ]t :tabnext<CR>
nnoremap <silent> [t :tabprevious<CR>

" Add empty lines
nnoremap ]<Space> m`o<Esc>``
nnoremap [<Space> m`O<Esc>``

" Remap Esc
" inoremap jj <Esc>l
inoremap <C-l> <Esc>

" Set leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Localization
"
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking

set wildmenu
set wcm=<Tab>
menu Spell.No\ Spell :set nospell<CR>
menu Spell.Russian&English :setlocal spell spelllang=ru,en<CR>
menu Spell.English :setlocal spell spelllang=en<CR>
menu Spell.Russian :setlocal spell spelllang=ru<CR>
map <F7> :emenu Spell.<Tab>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight indents and line breaks
" Solution 1
"
" ALL invisible chars: eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set listchars=tab:▸\·,eol:¬,space:·
set listchars=tab:▸\·,lead:·
set list!
nmap <leader>l :set list!<CR>

" Invisible character colors
highlight NonText ctermfg=darkgrey
highlight SpecialKey ctermfg=darkgrey

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight trailing whitespaces
"
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" On/Off string numbers
"
nmap <leader>n :set invnumber<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular settings
"
" Alignment on the first quote
vmap <leader>"  :'<,'>Tabularize /^[^"]*\zs"/l1r0<CR>
vmap <leader>=  :'<,'>Tabularize /=<CR>
vmap <leader>-> :'<,'>Tabularize /-><CR>
" Alignment on the first colon
vmap <leader>:  :'<,'>Tabularize /^[^:]*\zs:/l1r0<CR>
" Alignment on the first square bracket
vmap <leader>[  :'<,'>Tabularize /^[^\[]*\zs\[/l1r0<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine settings
"
" let g:indentLine_char = '┆'
let g:vim_json_syntax_conceal = 0
let g:indentLine_noConcealCursor=""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" AirLine settings
"
" let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
" включить управление табами
let g:airline#extensions#tabline#enabled = 1
" такое же поведение, как и в sublime: если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#fnametruncate = 0
" скрыть буферы
let g:airline#extensions#tabline#show_buffers = 0
" имя файла + расширение :help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'
" убираем раздражающие ненужные красные панели с предупреждениями или ошибками.
let g:airline_section_warning = ''
let g:airline_section_error = ''
" убираем "X" для закрытия вкладки мышью
let g:airline#extensions#tabline#show_close_button = 0
" убираем разделитель для вкладок
let g:airline#extensions#tabline#left_alt_sep = ''
" отключаем tagbar
let g:airline#extensions#tagbar#enabled = 0
" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1
" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1
" Не показывать метки [tabs] и [buffers]
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#buffers_label = ''
" Не показывать список буферов
let airline#extensions#tabline#show_splits = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale settings
"
" support for airline
let g:airline#extensions#ale#enabled = 1
" let g:ale_completion_enabled = 1

let g:ale_set_highlights = 0

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

"let g:ale_linters = {
"\   "javascript": ["eslint"],
"\   "typescript": ["tslint"],
"\   "css": [],
"\   "html": ["eslint"],
"\   "haskell": ["hdevtools", "hlint"],
"\   "clojure": ["clj-kondo"]
"\}

"let g:ale_linter_aliases = {'html': ['javascript']}
"let g:ale_javascript_standard_options = "--plugin html"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic settings

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1

" " Support for Clojure linter
" let g:syntastic_clojure_checkers = ['eastwood']
" " Disable syntastic on edn files
" let g:syntastic_ignore_files = ['\m\.edn$']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clojure settings

" настройки комментариев vim-commenter
autocmd FileType clojure setlocal commentstring=;;\ %s

" настройки работы с скобками auto-pairs
" au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"', '`':'`'}
au Filetype clojure let b:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}

" добавить поддержку boot
augroup filetypedetect
  " associate *.boot with clojure filetype
  au BufRead,BufNewFile *.boot setfiletype clojure
augroup END

" " Добавить поддержку edn
" augroup filetypedetect
"   " associate *.edn with clojure filetype
"   au BufRead,BufNewFile *.edn setfiletype clojure
" augroup END

" Evaluate Clojure buffers on load
"autocmd BufRead *.clj try | silent! Require | catch /^Fireplace/ | endtry

"autocmd filetype clojure nnoremap <F5> :w<CR>:Require<CR>
"autocmd filetype clojure nnoremap <F6> :Piggieback (figwheel-sidecar.repl-api/repl-env)<CR>

au FileType clojure let g:AutoPairsMapCR = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SLIME settings

" tmux support
let g:slime_target = "tmux"
" IPython support
let g:slime_python_ipython = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow parentheses settings
"

"let g:rainbow_active = 0
"autocmd Syntax   clojure RainbowToggleOn

" Use this settings for kien/rainbow_parentheses.vim plugin

" autocmd VimEnter *       RainbowParenthesesToggle
" autocmd Syntax   clojure RainbowParenthesesLoadRound
" autocmd Syntax   clojure RainbowParenthesesLoadSquare
" autocmd Syntax   clojure RainbowParenthesesLoadBraces

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet settings

"let g:user_emmet_install_global = 0
"autocmd FileType html,css,javascript.jsx,eelixir,htmljinja,htmldjango EmmetInstall
"let g:user_emmet_leader_key="<leader>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Supertab settings

" let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" if has("gui_running")
"   imap <c-space> <c-r>=SuperTabAlternateCompletion("<c-x><c-o>")<cr>
" else " no gui
"   if has("unix")
"     inoremap <Nul> <c-r>=SuperTabAlternateCompletion("<c-x><c-o>")<cr>
"   endif
" endif

" Отключение всплывающего окна Completion Menu
" set completeopt-=preview
" set completeopt=longest,menuone

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete settings
"
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#enable_camel_case = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
" let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
"  let g:deoplete#omni_patterns = {}
"  let g:deoplete#sources = {}
"  let g:deoplete#sources._ = []

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake settings
"
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python settings
"

" let g:python3_host_prog = '/home/lynch/.pyenv/versions/neovim3/bin/python'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JavaScript settings
"

"let g:tern_request_timeout = 1
"let g:tern_request_timeout = 6000
"let g:tern#command = ["tern"]
"let g:tern#arguments = ["--persistent"]

" Whether to include the types of the completions in the result data. Default: 0
"let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" data. Default: 0
"let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
"let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the
" client side. Default: 1
"let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
"let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some
" heuristics to try and return some properties anyway. Set this to 0 to
" turn that off. Default: 1
"let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
"let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
"let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been
" spelled out by at least two characters. Default: 1
"let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
"let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
"let g:deoplete#sources#ternjs#in_literal = 0


"Add extra filetypes
"let g:deoplete#sources#ternjs#filetypes = [
"                \ 'jsx',
"                \ 'javascript.jsx',
"                \ 'vue',
"                \ 'html'
"                \ ]

" " Add support javascript in html
" augroup FiletypeGroup
"     autocmd!
"     au BufNewFile,BufRead *.html set filetype=javascript.html
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang settings
"
" let g:go_version_warning = 0
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TypeScript settings
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Java settings
"
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"autocmd FileType java setlocal shiftwidth=4 softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C# settings
"
"autocmd FileType cs setlocal shiftwidth=4 softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F# settings
"
autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi set filetype=fsharp
autocmd FileType fsharp setlocal shiftwidth=4 softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C# settings
"
"let g:OmniSharp_server_stdio = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient-neovim configuration
"
" Required for operations modifying multiple buffers like rename.
"set hidden

"let g:LanguageClient_serverCommands = {
"    \ 'haskell': ['hie-wrapper'],
"    \ 'fsharp': ['dotnet', '/home/lynch/projects/FSharp/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp2.0/FSharpLanguageServer.dll'],
"    \ }

"autocmd filetype haskell nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"autocmd filetype haskell nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"autocmd filetype haskell nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"autocmd filetype haskell nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']

"autocmd filetype fsharp nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"autocmd filetype fsharp nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"autocmd filetype fsharp nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"autocmd filetype fsharp nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim json settings
"au FileType json let g:indentLine_fileTypeExclude = ['json']
"au FileType json set conceallevel=0
