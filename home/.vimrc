" Integrate vim with tmux
" https://github.com/Florianjw/vimrc/blob/master/vimrc

scriptencoding utf-8
set encoding=utf-8

set nocompatible

" enable GDB debuger termdebug
packadd termdebug

" run vimrc from local directory
set exrc

" show row & col in bottom-right of the screen
set ruler

" set line numbers
set number

" Can use mouse while working
set mouse=a

" Display all matching files when we tab complete
set wildmenu

" Search moves to matched string while typing
set incsearch

" case insensitive search
set ignorecase

" Update file when updated from outside
set autoread

" backspace works as normal
set backspace=2

highlight Comment ctermbg=DarkGray
highlight Constant ctermbg=Blue
highlight Normal ctermbg=Black
highlight NonText ctermbg=Black
highlight Special ctermbg=DarkMagenta
highlight Cursor ctermbg=Green

" this next line is needed to enable your custom colors:
syntax enable

" Enable syntax highlighting
syntax on


" set listchars=tab:⎸\ ,trail:·
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
" show tabs as >---
set listchars=tab:>-
set list

set nowrap


" display title of current file in terminal title bar
set title

" Highlight search results
set hlsearch


" enable plugins (for netrw)
set nocp
filetype plugin on

" Search down into subfolders
" Provides tab-completition for all file-related tasks
set path+=**

" change colorscheme
set background=light
colorscheme PaperColor

" tab = 4 spaces
set tabstop=4
set shiftwidth=4

" tab uses spaces
set expandtab

" keeps indent from previous line
set autoindent

" Always show the status line
set laststatus=2

" Format status line to show CWD and line/column
" set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Ln:\ %l\ \ Col:\ %c

set directory^=$HOME/.vim/swapfile//
set undofile
set undodir^=$HOME/.vim/undofile//

set gdefault   " replace works globaly
set incsearch  " search while typing
set hlsearch   " highlight search-results
set showmatch  " show matching braces

" set spell checking default off
" setlocal spell spelllang=en_us
set spell spelllang=en_us
set nospell
let g:markdown_fenced_languages = ['c', 'c++', 'java', 'python', 'javascript']


"-- FSSwitch


nnoremap <leader>h : FSSplitRight<cr>

 """ -------------------- ctrl-p CONFIG -------------------------
" default command for starting ctrl-p
let g:ctrlp_map='<c-y>'

" override default command for exiting ctrl-p prompt
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<c-i>', '<c-c>'],
        \ 'ToggleType(1)': ['c-down>']  }

" ctrl-p search directory is CWD
let g:ctrlp_working_path_mode='w'

" ctrl-p will include dotfiles in its search
let g:ctrlp_show_hidden=1

"-----------------------clang-format-------------------------"
"setlocal cindent cino=N-s
""set autoindent
" Toggle auto formatting:i

" "Auto formatting code when saving file
let g:clang_format#auto_format=1

" Toggle auto formatting:
let g:clang_format#style_options = {
            \ "NamespaceIndentation" : "All",
            \ "AccessModifierOffset" : -2,
            \ "AlignTrailingComments" : "true",
            \ "AlignAfterOpenBracket" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "Inline",
            \ "BreakBeforeBraces" : "Linux",
            \ "BraceWrapping" : {
            \ "AfterControlStatement" : "true",
            \ "AfterClass " : "true",
            \ "AfterNamespace " : "true",
            \ },
            \ "ColumnLimit" : 100,
            \ "UseTab" : "Never" }


nmap <Leader>C :ClangFormatAutoToggle<CR>
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>

""" --------------------Ctags & Autocomplete------------------
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/cairo
set tags+=~/.vim/tags/gtkmm
set tags+=~/.vim/tags/gdk
set tags+=~/.vim/tags/gtk
set tags+=~/.vim/tags/glib

" build tags of your own project with Ctrl-F12
map! <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>


"""----------------------------OmniCppComplete---------------------------------
set nocp
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
    " automatically open and close the popup menu / preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
    set completeopt=menuone,menu,longest,preview


"-----------------------lightline ---------------------------
"show the mode  is unnecessary anymore because the mode information is displayed in the statusline.
"https://github.com/itchyny/lightline.vim
set noshowmode
let g:lightline = {
     \ 'colorscheme': 'PaperColor',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }


"""---------------------FUNCTIONS ---------------------------
" remove trailing whitespace from lines and preserve cursor position
function! SplitTab()
    let l = line(".")
    let c = col(".")
 :tabe %
    call cursor(l, c)
endfun

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" remove trailing spaces on save
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


""" -------------------- Custom commands -------------------------
" custom command for performing search in all source files
command! -nargs=1 Search vimgrep <args> **/*.c **/*.cpp **/*.h **/*.json | cw

" find-replace current word under cursor with given parameter
command! -nargs=1 ReplaceWith :exec("%s/\\<".expand("<cword>")."\\>/<args>/gc")


""" ---------------- MAPPINGS

" Read the copyright template ns paste in the current cursor position
nnoremap <leader>, :-1read COPYRIGHT.md<CR>21jwf>a

" build tags for own projects with Ctrl-F12
map! <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" switch tabs using Ctrl+[Left/Right]
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" map moving tabs
nnoremap <C-Up> :tabm +1<CR>
nnoremap <C-Down> :tabm -1<CR>

" map switch windows
nnoremap <Tab> <C-w>w

" map resizing buffers
nnoremap <A-Right> :vertical resize+5<CR>
nnoremap <A-Left> :vertical resize-5<CR>
nnoremap <A-Up> :resize+5<CR>
nnoremap <A-Down> :resize-5<CR>

" map turning off highlighting after search
nnoremap <Esc><Esc> :noh<CR>

""""""""""""""""""""""""""""" MRU plugin """"""""""""""""""""""""""""""
let MRU_Max_Entries = 150
let MRU_Exclude_Files = '^/tmp/.*\|^/var/tmp/.*'  " For Unix
let MRU_Window_Height = 15

map <leader>f :MRU<CR>

"------------------- netrw Config https://shapeshed.com/vim-netrw/ --------------------------
nnoremap <C-e> :Vexplore<CR>
" set modes
let g:netrw_liststyle = 3
let g:netrw_banner = 0
" Changing how files are opened
" 1 - open files in a new horizontal split
" 2 - open files in a new vertical split
" 3 - open files in a new tab
" 4 - open in previous window
let g:netrw_browse_split = 3
let g:netrw_winsize = 25
let g:netrw_sort_options = "i"
let g:netrw_altv = 1    " close after select

" open at start up
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END



""""""""""""""""" Key Maps
" set autocomplete braces etc.
inoremap { {<CR>}<Esc>ko
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap " ""<Left>

" save the current document
" this is very special key and colides with the terminal and makes it freeze
" to use it set in .bashrc stty -ixon
map <C-s> :w <CR>
imap <C-s> <Esc> :w <CR>i


" close tab
map <C-z> :close <CR>

" Open new Tab
nnoremap <C-n> :tabnew <CR>

" select all
noremap <C-a> ggVG

" coppy selection in visual mode
vmap <C-c> y

" paste and change to insert mode
map <C-p> <Esc> pi

" Cut
map <C-x> d

" Find :
map <C-f> /

" Find next
nmap <F3> n

" changes from insert mode Visual mode selection
inoremap <C-Up> <esc> V
inoremap <C-Right> <esc> v

" Replace All
map <C-h> :%s/__/__/gcI

" Replace all in selection
noremap <C-j> :%s/\%V___/___/gc

nmap <F8> :TagbarToggle<CR>

" map searching for symbol in all file
nnoremap <F2> :call SplitTab()<CR>
    \ *
    \ :exec("Search ".expand("<cword>"))<CR>


" when finding a definition with csope, open results in a new tab
nnoremap <F4> :call SplitTab()<CR>
    \ *
    \ :exec("cs find s ".expand("<cword>"))<CR>
    \ :copen<CR>



" make and copen results window
"map! <C-S-b> :cclose<CR> :wa <CR> :make -j8 <CR> :copen <CR>
"map! <C-S-b> :cclose<CR> :wa <CR> :make-j8 <CR> :cwindow 10
"set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormater

" Command Make will call make and then cwindow which
" opens a 3 line error window if any errors are found.
" If no errors, it closes any open cwindow.
map! <C-S-b> :wa<CR> :Make<CR>
command -nargs=* Make make -j6 <args> | cwindow 12


" Clipboard
" alias unnamed register to the + register, which is the X Window clipboard.
" Checking for X11-clipboard support in terminal vim --version | grep clipboard
" if not clipboard support install patch from here: " https://gist.github.com/nelstrom/7436569
set clipboard=unnamed

nnoremap <leader>c "+y
vnoremap <leader>c "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p















