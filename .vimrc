
" File: .vimrc
" Author: Jake Zimmerman <jake@zimmerman.io>
" Modified by: David Brown
"
" How I configure Vim :P
"

" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set path+=**

call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
"Plugin 'kchmck/vim-coffee-script'

Plugin 'mattn/emmet-vim'
Plugin 'isRuslan/vim-es6'
Plugin 'DavidEGx/ctrlp-smarttabs'
Plugin 'Chiel92/vim-autoformat'
Plugin 'reewr/vim-monokai-phoenix'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'ap/vim-css-color'
" let g:cssColorVimDoNotMessMyUpdatetime = 1
Plugin 'rking/ag.vim'
Plugin 'matze/vim-move'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
"Plugin 'ntpeters/vim-better-whitespace'
" Align CSV files at commas, align Markdown tables, and more
Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'paradigm/vim-multicursor'
Plugin 'craigemery/vim-autotag'
Plugin 'ervandew/supertab'
Plugin 'leafgarland/typescript-vim'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a
let mapleader = ","

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256

" Set the colorscheme
colorscheme Monokai

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1


" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
" let g:nerdtree_tabs_open_on_console_startup = 1
let g:NERDTreeWinPos = "right"


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/target,*/node_modules,*/tmp,*/api-docs,*/api-docs/*,*/api-docs*,*bundle*
" let g:ctrlp_custom_ignore = 'node_modules/|DS_Store/|git|target/|tmp\|tmp/'

filetype plugin indent on
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set backupcopy=yes
set nowrap
"nmap <C-S-Up> :m-2<cr>
"nmap <C-S-Down> :m+<cr>


if executable('ag')
    " Use ag over grep
    "'ag --nogroup --nocolor --column --ignore backbone --ignore node_modules --ignore bundle --ignore "*/api-docs/*" --ignore kendo'
    set grepprg=ag\ --nogroup\ --nocolor\ --column

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g "'

    " ag is fast enough that CtrlP doesn't need to cache
    " let g:ctrlp_use_caching = 0
endif

" set relativenumber

let g:move_key_modifier = 'C'
set paste
let g:ctrlp_max_files=0

" removes trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

let g:formatterpath = ['C:\Users\david\dev\zenig4\Zenig-web\zenig\src\main\webapp\app']


" beautify
map <c-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

nnoremap <S-u> :<c-u>call MultiCursorPlaceCursor()<cr>

set colorcolumn=80,120
set splitright

" the amount of lines kept when scolling to the bottom. otherwise it only shows the last line
set scrolloff=20

" allows for undo after :bnext, :bprevious (which is set to tab/shift tab above)
set hidden


imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
set ff=unix
set list
au BufRead,BufNewFile *.js set fileformat=unix
au BufRead,BufNewFile *.html set fileformat=unix
au BufRead,BufNewFile *.md set wrap nolist linebreak

se cursorline
