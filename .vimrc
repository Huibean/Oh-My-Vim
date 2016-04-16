call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dyng/ctrlsf.vim'
Plug 'kien/ctrlp.vim'
Plug 'mxw/vim-jsx'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'justinj/vim-react-snippets'
Plug 'flazz/vim-colorschemes'
Plug 'ervandew/supertab'
Plug 'Shougo/neocomplete.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'amirh/HTML-AutoCloseTag'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/sessionman.vim'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow'

call plug#end()

"============ Common Setting Begin ============"
"syntax on
set sw=2
set ts=2
set nu! 
set hlsearch
set expandtab 
set cursorline
:highlight CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set backspace=2
set showmatch
set autoindent
set nocompatible
set completeopt=preview,menu
set viewoptions=folds,options,cursor,unix,slash
set history=1000
set spell
set hidden
set iskeyword-=.
set iskeyword-=#
set iskeyword-=-
set virtualedit=onemore
set nobackup
set mouse=a
set mousehide
set clipboard=unnamed

map <S-l> :tabn <CR>
map <S-h> :tabp <CR>
map <C-w> :vsp <CR>
"============ Common Setting End ============"

"============ AutoComplete Setting Begin ============"
let g:UltiSnipsExpandTrigger="<tab>"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"============ AutoComplete Setting End ============"

"============ Rainbow Setting Begin ============"
let g:rainbow_active = 1
"============ Rainbow Setting End ============"

"============ Emmet Setting Begin ============"
let g:user_emmet_leader_key='<C-Z>'
"============ Emmet Setting End ============"

"============ Color Setting Begin ============"
colorscheme ir_black
"============ Color Setting End ============"

"============ NNERDTress Setting Begin ============" 
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-e> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('jsx', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"============ NNERDTress Setting End ============" 

"============ CtrlSF Setting Begin ============"
nmap <C-f> :CtrlSF 
"map <S-f> :call Search_Word()<CR>
"function Search_Word()
"  let w = expand("<cword>") " 在当前光标位置抓词
"  execute ":CtrlSF " w " ."
"endfunction
"搜索目录
let g:ctrlsf_default_root = 'project'
"搜索内容
let g:ctrlsf_context = '-B 5 -A 3'
let g:ctrlsf_case_sensitive = 'no'
let g:ctrlsf_auto_close = 0
let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ }
let g:ctrlsf_position = 'left'
let g:ctrlsf_winsize = '30%'

"<C-J> - Move cursor to next match.
"<C-K> - Move cursor to previous match.
"-R - Use regular expression pattern.
"-I, -S - Search case-insensitively (-I) or case-sensitively (-S).
"============ CtrlSF Setting End ============"

"============ CtrlP Setting Begin ============"
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|bower_components\|.sass-cache\|.git\|build'
"let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
"============ CtrlP Setting End ============"

"============ Vim-Jsx Setting Begin ============"
"let g:jsx_ext_required = 1
"let g:jsx_pragma_required = 1
"============ Vim-jsx Setting End ============"
