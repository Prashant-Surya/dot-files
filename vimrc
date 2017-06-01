" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set tabstop=4
set expandtab
set shiftwidth=4
set tw=79
set wrap
set linebreak
set nolist
set hlsearch

" Diable word wrap for some files
autocmd BufNewFile,BufRead *.html set tw=0
autocmd BufNewFile,BufRead *.sh set tw=0

" Source a global configuration file if availabl
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set nocompatible

set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()

"Include vimrc bundle list
if filereadable("/etc/vim/vimrc.bundlexs")
    so /etc/vim/vimrc.bundlexs
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

filetype plugin indent on     " required!



" some commands from vim
command! -nargs=* -complete=file Gcheckout :!git checkout %
command! -nargs=* -complete=file GDiff :!git diff %
command! -nargs=* -complete=file Ar :!sudo /etc/init.d/apache2 restart
command! -nargs=* -complete=file Rs :!export SRCPATH=%:p:h && export DESTPATH=${SRCPATH/static_media/static} && /home/`whoami`/webapps/django/mycareerstack/libjs/stylus/bin/stylus % && mv %:r.css $DESTPATH
command! -nargs=* -complete=file Cp :!export SRCPATH=%:p:h && export DESTPATH=${SRCPATH/static_media/static} && cp % $DESTPATH
command! -nargs=* -complete=file Hbs :!export SRCPATH=%:p:h && export DESTPATH=${SRCPATH/static_media/static} && export TEMPLATEPATH=$DESTPATH/handlebars_templates.js && export NAMESPACE=Handlebars.%:p:h:t_templates && mkdir -p $DESTPATH && handlebars -m -e hbs -n $NAMESPACE $SRCPATH -f $TEMPLATEPATH && echo $TEMPLATEPATH

" editting settings in vim
set autoindent cin ic smartcase incsearch nu

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
" set background=dark


python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup




" Move between split windows
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" switch between models, views, urls, admin and forms with the 
" following shortcut ,m ,v ,u ,a ,f
let pattern = 'models\|views\|urls\|admin\|forms'
nmap ,m :e <C-R>=substitute(expand("%"), pattern, "models", "")<CR><CR>
nmap ,v :e <C-R>=substitute(expand("%"), pattern, "views", "")<CR><CR>
nmap ,u :e <C-R>=substitute(expand("%"), pattern, "urls", "")<CR><CR>
nmap ,a :e <C-R>=substitute(expand("%"), pattern, "admin", "")<CR><CR>
nmap ,f :e <C-R>=substitute(expand("%"), pattern, "forms", "")<CR><CR>

" Sort the current paragraph.
" Useful for sorting includes, imports, namespaces and other declaration groups.
" With this enabled, you can just insert ur statement anywhere and just press ,s
nmap ,s {jv}k:sort<CR>

" make backspace "more powerful"
set backspace=indent,eol,start

" makes tabs insert "indents" at the beginning of the line
set smarttab

" toggles paste mode
nmap \o :set paste!<CR>

" toggles line numbers
nmap \l :setlocal number!<CR>

" move up and down a single row on the screen
nmap j gj
nmap k gk

" Vim command line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Clear highlight search
nmap \q :nohlsearch<CR>

" Buffers
nmap <C-e> :e#<CR>
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" Ctrl-P plugin
nmap ; :CtrlPBuffer<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" Toggles nerd tree
nmap \e :NERDTreeToggle<CR>

" Support 256 colors
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

" Vim powerline
let g:Powerline_symbols = 'fancy'
set laststatus=2
set fillchars+=stl:\ ,stlnc:\

" Reading others' code
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

" Closetag script
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

"Python syntax checkers
"let g:syntastic_python_checkers = ['pylint']

"Buffer config for markdown files
au BufNewFile,BufRead *.md set ft=md

"highlight empty spaces
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" config for handlebar files
au BufReadPost *.hbs set syntax=mustache

" CSS3 syntax
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" Jedi
"let g:jedi#use_splits_not_buffers =  \"left"
"let g:jedi#popup_select_first = 0
"let g:jedi#popup_on_dot = 0
"autocmd FileType python setlocal completeopt=menu

python import sys, os
python sys.path.append(os.environ['HOME']+'/webapps/django/mycareerstack/')
python sys.path.append(os.environ['HOME']+'/webapps/django/mycareerstack/apps/')

"Include custom vimrc config
if filereadable("/etc/vim/vimrc.custom")
    so /etc/vim/vimrc.custom
endif

set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4

set guifont=Source\ Code\ Pro\ for\ Powerline

syntax on
"color dracula
